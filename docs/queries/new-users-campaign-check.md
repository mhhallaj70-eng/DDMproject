# بررسی کمپین ۲۷–۲۸ اردیبهشت ۱۴۰۵ (۱۷–۱۸ May 2026)

تعریف new user: **first-seen** در `stats.watch_events` با `watch_duration ≥ 10s` → ثبت‌نام + اولین فعالیت معنادار.
Datasource: **ClickHouse** (Grafana Explore).
Baseline: میانگین ۳۰ روز قبل از کمپین (۱۷ آوریل تا ۱۶ مه).

---

## Q1 — جواب سریع: lift کمپین vs baseline ۳۰ روزه

```sql
WITH first_seen AS (
  SELECT user_id, toDate(MIN(created_at)) AS first_day
  FROM stats.watch_events
  WHERE user_id != '' AND user_id != 'total'
    AND watch_duration >= 10
    AND created_at >= toDate('2026-03-01')   -- look-back کافی
  GROUP BY user_id
),
daily AS (
  SELECT first_day AS day, count() AS cnt
  FROM first_seen
  GROUP BY first_day
)
SELECT
  round(avgIf(cnt, day BETWEEN toDate('2026-04-17') AND toDate('2026-05-16'))) AS baseline_avg_per_day,
  round(avgIf(cnt, day BETWEEN toDate('2026-05-17') AND toDate('2026-05-18'))) AS campaign_avg_per_day,
  sumIf(cnt, day BETWEEN toDate('2026-05-17') AND toDate('2026-05-18'))        AS campaign_total,
  round(100 * (
    avgIf(cnt, day BETWEEN toDate('2026-05-17') AND toDate('2026-05-18')) -
    avgIf(cnt, day BETWEEN toDate('2026-04-17') AND toDate('2026-05-16'))
  ) / nullIf(avgIf(cnt, day BETWEEN toDate('2026-04-17') AND toDate('2026-05-16')), 0), 1) AS lift_pct
FROM daily
```

تفسیر سریع:
- `lift_pct > +15%` → کمپین کار کرده، نتایج آماری معنادار.
- `lift_pct ±5%` → noise، اثر قابل تشخیص نیست.
- `lift_pct < -10%` → افت، چیزی شکسته یا campaign cannibalized.

---

## Q2 — جدول روزانه برای دیدن منحنی

```sql
WITH first_seen AS (
  SELECT user_id, toDate(MIN(created_at)) AS first_day
  FROM stats.watch_events
  WHERE user_id != '' AND user_id != 'total'
    AND watch_duration >= 10
    AND created_at >= toDate('2026-03-01')
  GROUP BY user_id
)
SELECT first_day AS day, count() AS new_users
FROM first_seen
WHERE first_day BETWEEN toDate('2026-04-17') AND toDate('2026-05-31')
GROUP BY first_day
ORDER BY first_day
```

روزهای ۱۷ و ۱۸ مه رو با میانگین روزهای اطراف مقایسه کن.

---

## ⚠️ ریسک‌ها و caveats

1. **این "active new user" است، نه "signup خالی"**. کاربری که signup کرد و هیچ ویدیو نگاه نکرد ←‌ شمارش نمی‌شه. اگر می‌خوای raw signup رو هم ببینی، باید از جدول auth (تو DB کاربر، نه dashboard data sources) پرس کنی.
2. **late attribution**: کسی که ۱۷ مه دانلود کرد و ۲۰ مه اولین play رو زد، توی day=20 می‌افته نه ۱۷. کمپین‌های ۲ روزه معمولاً ۳–۵ روز tail دارن. → بازه ۱۷–۲۲ مه رو هم نگاه کن.
3. **lift از noise**: ۲ روز نمونه‌ی کوچکیه. اگر baseline σ بزرگ داره، lift ۱۰٪ ممکنه random باشه. اگر می‌خوای محکم‌تر باشه: t-test بین campaign window و سری ۳۰ روزه baseline.
4. **anonymous attribution gap**: ۳۵٪ events بدون user_id هستند (per memory). اگر کمپین trafficِ زیادی برای anonymous browsing آورده اما به signup منجر نشده ← این کوئری نمی‌بینتش. می‌تونی نسبت `anonymous_events / total_events` در همون بازه رو هم چک کنی.
5. **بدون attribution infrastructure** (که Q1 1405 توی roadmap هست) نمی‌شه گفت "این x نفر از کمپین آمدند". فقط دیده می‌شه که "x نفر بیشتر از baseline آمدند". correlation ≠ causation.

---

## Panel‌های اضافه‌شده به داشبورد

ROW 9 — Acquisition (New Users)
- **Panel 50** — Time series روزانه + خط baseline ۳۰ روزه rolling
- **Panel 51** — Today New Users (stat)
- **Panel 52** — Last 7d vs 30d Baseline Lift % (stat، رنگ‌بندی red/yellow/green/blue)
- **Panel 53** — Table 45 روز اخیر با ستون lift_pct رنگی

برای دیدن اثر کمپین در پنل: time range رو ۱ آوریل تا ۳۱ مه بزن، spike در ۱۷–۱۸ مه باید قابل تشخیص باشه.
