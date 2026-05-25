# مرحله ۴: Baseline Queries برای ۵ KPI (سال ۱۴۰۴)

**تاریخ**: ۲۴ مه ۲۰۲۶  
**منبع**: PostgreSQL (via Grafana)  
**دوره**: ۱ فروردین ۱۴۰۴ تا ۲۹ اسفند ۱۴۰۴

---

## Query Set #۱: D1 Retention Rate (Cohort Analysis)

### Query 1.1: New Users Per Day (۱۴۰۴)
```sql
SELECT 
  DATE(created_at) AS cohort_date,
  COUNT(DISTINCT user_id) AS new_users
FROM users
WHERE created_at >= '2025-03-20' 
  AND created_at < '2026-03-20'
  AND platform = 'android'  -- Focus on Android (GA4 Property)
GROUP BY DATE(created_at)
ORDER BY cohort_date;
```

### Query 1.2: D1 Retention (برگشت روز دوم)
```sql
WITH new_users AS (
  SELECT 
    user_id,
    DATE(created_at) AS cohort_date
  FROM users
  WHERE created_at >= '2025-03-20' 
    AND created_at < '2026-03-19'  -- Exclude last day
    AND platform = 'android'
),
d1_active AS (
  SELECT DISTINCT
    user_id,
    DATE(created_at) AS active_date
  FROM events  -- یا activity_log
  WHERE created_at >= '2025-03-20'
    AND created_at < '2026-03-20'
    AND (event_type IN ('watch', 'click', 'mission_complete', 'medal_earned'))
)
SELECT 
  nu.cohort_date,
  COUNT(DISTINCT nu.user_id) AS new_users,
  COUNT(DISTINCT CASE 
    WHEN DATEDIFF(day, nu.cohort_date, da.active_date) = 1 
    THEN nu.user_id 
  END) AS d1_returned,
  ROUND(
    100.0 * COUNT(DISTINCT CASE 
      WHEN DATEDIFF(day, nu.cohort_date, da.active_date) = 1 
      THEN nu.user_id 
    END) / COUNT(DISTINCT nu.user_id), 
    2
  ) AS d1_retention_pct
FROM new_users nu
LEFT JOIN d1_active da ON nu.user_id = da.user_id
GROUP BY nu.cohort_date
ORDER BY nu.cohort_date;
```

---

## Query Set #۲: D7 + D30 Retention

```sql
WITH new_users AS (
  SELECT 
    user_id,
    DATE(created_at) AS cohort_date
  FROM users
  WHERE created_at >= '2025-03-20'
    AND created_at < '2026-02-19'  -- Allow 30 days lookback
    AND platform = 'android'
),
activity AS (
  SELECT DISTINCT
    user_id,
    DATE(created_at) AS active_date
  FROM events
  WHERE platform = 'android'
)
SELECT 
  nu.cohort_date,
  COUNT(DISTINCT nu.user_id) AS new_users,
  -- D7
  COUNT(DISTINCT CASE 
    WHEN DATEDIFF(day, nu.cohort_date, a.active_date) BETWEEN 1 AND 7
    THEN nu.user_id 
  END) AS d7_users,
  ROUND(100.0 * COUNT(DISTINCT CASE 
    WHEN DATEDIFF(day, nu.cohort_date, a.active_date) BETWEEN 1 AND 7
    THEN nu.user_id 
  END) / COUNT(DISTINCT nu.user_id), 2) AS d7_retention_pct,
  -- D30
  COUNT(DISTINCT CASE 
    WHEN DATEDIFF(day, nu.cohort_date, a.active_date) BETWEEN 1 AND 30
    THEN nu.user_id 
  END) AS d30_users,
  ROUND(100.0 * COUNT(DISTINCT CASE 
    WHEN DATEDIFF(day, nu.cohort_date, a.active_date) BETWEEN 1 AND 30
    THEN nu.user_id 
  END) / COUNT(DISTINCT nu.user_id), 2) AS d30_retention_pct
FROM new_users nu
LEFT JOIN activity a ON nu.user_id = a.user_id
GROUP BY nu.cohort_date
ORDER BY nu.cohort_date;
```

---

## Query Set #۳: Conversion to Payer Rate

```sql
-- Monthly Conversion Rate
WITH active_users AS (
  SELECT DISTINCT
    user_id,
    DATE_TRUNC('month', created_at)::DATE AS month
  FROM events
  WHERE DATE_TRUNC('year', created_at) = '2025-03-20'::DATE  -- سال ۱۴۰۴
    AND platform = 'android'
),
paying_users AS (
  SELECT DISTINCT
    user_id,
    DATE_TRUNC('month', purchase_date)::DATE AS month
  FROM transactions
  WHERE DATE_TRUNC('year', purchase_date) = '2025-03-20'::DATE
    AND status = 'completed'
)
SELECT 
  au.month,
  COUNT(DISTINCT au.user_id) AS total_active_users,
  COUNT(DISTINCT pu.user_id) AS paying_users,
  ROUND(
    100.0 * COUNT(DISTINCT pu.user_id) / COUNT(DISTINCT au.user_id),
    2
  ) AS conversion_to_payer_pct
FROM active_users au
LEFT JOIN paying_users pu ON au.user_id = pu.user_id AND au.month = pu.month
GROUP BY au.month
ORDER BY au.month;
```

---

## Query Set #۴: ARPU (Average Revenue Per User)

```sql
-- Daily ARPU
WITH daily_revenue AS (
  SELECT 
    DATE(purchase_date) AS date,
    SUM(amount_rial) AS total_revenue
  FROM transactions
  WHERE DATE_TRUNC('year', purchase_date) = '2025-03-20'::DATE
    AND status = 'completed'
  GROUP BY DATE(purchase_date)
),
daily_active AS (
  SELECT 
    DATE(created_at) AS date,
    COUNT(DISTINCT user_id) AS dau
  FROM events
  WHERE DATE_TRUNC('year', created_at) = '2025-03-20'::DATE
  GROUP BY DATE(created_at)
)
SELECT 
  dr.date,
  dr.total_revenue,
  da.dau,
  ROUND(dr.total_revenue::NUMERIC / NULLIF(da.dau, 0), 0) AS arpu
FROM daily_revenue dr
LEFT JOIN daily_active da ON dr.date = da.date
ORDER BY dr.date;

-- Monthly ARPU
SELECT 
  DATE_TRUNC('month', purchase_date)::DATE AS month,
  SUM(amount_rial) AS total_revenue,
  (
    SELECT COUNT(DISTINCT user_id)
    FROM events
    WHERE DATE_TRUNC('month', created_at) = DATE_TRUNC('month', transactions.purchase_date)
  ) AS mau,
  ROUND(SUM(amount_rial)::NUMERIC / NULLIF(
    (SELECT COUNT(DISTINCT user_id) FROM events 
     WHERE DATE_TRUNC('month', created_at) = DATE_TRUNC('month', transactions.purchase_date)
    ), 0
  ), 0) AS arpu
FROM transactions
WHERE DATE_TRUNC('year', purchase_date) = '2025-03-20'::DATE
  AND status = 'completed'
GROUP BY DATE_TRUNC('month', purchase_date)
ORDER BY month;
```

---

## Query Set #۵: Gamification Engagement Score

```sql
-- Daily Gamification Engagement
WITH daily_mission AS (
  SELECT 
    DATE(completed_at) AS date,
    COUNT(DISTINCT user_id) AS users_completed_mission
  FROM mission_completion
  WHERE DATE_TRUNC('year', completed_at) = '2025-03-20'::DATE
  GROUP BY DATE(completed_at)
),
daily_medal AS (
  SELECT 
    DATE(earned_at) AS date,
    COUNT(DISTINCT user_id) AS users_earned_medal
  FROM medal_earned
  WHERE DATE_TRUNC('year', earned_at) = '2025-03-20'::DATE
  GROUP BY DATE(earned_at)
),
daily_league AS (
  SELECT 
    DATE(joined_at) AS date,
    COUNT(DISTINCT user_id) AS users_in_league
  FROM league_participation
  WHERE DATE_TRUNC('year', joined_at) = '2025-03-20'::DATE
  GROUP BY DATE(joined_at)
),
daily_active AS (
  SELECT 
    DATE(created_at) AS date,
    COUNT(DISTINCT user_id) AS dau
  FROM events
  WHERE DATE_TRUNC('year', created_at) = '2025-03-20'::DATE
  GROUP BY DATE(created_at)
)
SELECT 
  da.date,
  da.dau,
  COALESCE(dm.users_completed_mission, 0) AS mission_users,
  COALESCE(dmd.users_earned_medal, 0) AS medal_users,
  COALESCE(dl.users_in_league, 0) AS league_users,
  ROUND(
    100.0 * (
      COALESCE(dm.users_completed_mission, 0) +
      COALESCE(dmd.users_earned_medal, 0) +
      COALESCE(dl.users_in_league, 0)
    ) / NULLIF(da.dau, 0),
    2
  ) AS gamification_engagement_pct
FROM daily_active da
LEFT JOIN daily_mission dm ON da.date = dm.date
LEFT JOIN daily_medal dmd ON da.date = dmd.date
LEFT JOIN daily_league dl ON da.date = dl.date
ORDER BY da.date;
```

---

## مراحل اجرایی

### Step 1: Test Connectivity
```bash
curl -X POST "https://graf.didimoon.com/api/datasources/proxy/1/query" \
  -H "Authorization: Bearer {API_KEY}" \
  -H "Content-Type: application/json" \
  -d '{
    "queries": [{
      "refId": "A",
      "rawSql": "SELECT 1 as test"
    }]
  }'
```

### Step 2: اگر Grafana API نکرد، مستقیم به PostgreSQL
```bash
psql -h {HOST} -U {USER} -d {DATABASE} -c "SELECT COUNT(*) FROM users WHERE created_at >= '2025-03-20';"
```

### Step 3: اگر باید بماند، export CSV از Grafana UI
- هر query رو Grafana میں create کن
- Export به CSV
- فایل‌ها رو بفرستید

---

## نکات

⚠️ **Schema Assumptions**:
- جداول: `users`, `events`, `transactions`, `mission_completion`, `medal_earned`, `league_participation`
- فیلدها: `user_id`, `created_at`, `purchase_date`, `amount_rial`, `platform`, `status`
- اگر schema متفاوت است، queries رو باید adjust کنیم

⚠️ **Timezone**: فرض شده است که تمام timestamps UTC یا local ایران است
- اگر مختلف است، `AT TIME ZONE` اضافه کنید

---

## مرحله بعدی (۵)
**تعریف Target واقع‌بینانه برای هر KPI**
