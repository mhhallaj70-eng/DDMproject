# DDM Quarterly KPI Dashboard

داشبورد رصد فصلی KPIهای DDM. منبع: گزارش ۱۴۰۴ + KPI Framework v3.

## فایل‌ها

| فایل | نقش |
|------|-----|
| `quarterly-kpi-dashboard.json` | داشبورد Grafana — import مستقیم |
| `b2b_revenue_schema.sql` | جدول PostgreSQL برای ورود ماهانه ISP + Rubika |

## نصب — یک‌بار

### ۱. ساخت جدول B2B در PostgreSQL

```bash
psql -h <score-db-host> -U <user> -d <score-db> < b2b_revenue_schema.sql
```

این کار:
- schema `business` ایجاد می‌کنه
- جدول `business.b2b_revenue` با UNIQUE constraint روی `(month_jalali, source)`
- داده تاریخی ۱۴۰۴ Q1–Q4 رو از گزارش وارد می‌کنه (با `ON CONFLICT DO NOTHING` → idempotent)

### ۲. Import داشبورد در Grafana

1. `https://graf.didimoon.com` → Dashboards → New → Import
2. آپلود `quarterly-kpi-dashboard.json`
3. سه datasource map کن:
   - `DS_CLICKHOUSE` → ClickHouse production
   - `DS_MYSQL` → Subscription DB
   - `DS_POSTGRES` → Score DB (همون که جدول `business.b2b_revenue` توشه)
4. Save.

## ساختار داشبورد

| ROW | Source | محتوا |
|-----|--------|-------|
| 1. Daily Pulse | ClickHouse | DAU/MAU/Stickiness/Watch Hours |
| 2. In-App Revenue | MySQL | NET Toman، txn، Cafebazaar vs Myket، per-plan |
| 3. Trial Funnel | MySQL | DRAFTs، Activation %، Trial→Paid 90d cohort |
| 4. B2B Revenue | Postgres | ISP MCI+MTN، Rubika، Revenue Mix |
| 5. Content | ClickHouse | per-via، top 10، new releases |
| 6. Health Alerts | ClickHouse+MySQL | Anonymous %، Cart Abandonment، DAU WoW |

## Variables

- `$gateway` — All / Cafebazaar / Myket → فیلتر روی ROW 2 و 3
- `$via` — All / VOD / Magazine / Cinema / TV / UGC (آماده استفاده در فیلترها)
- `$watch_min` — حد فعالیت (پیش‌فرض ۶۰ ثانیه) → روی DAU و stickiness

## ورود ماهانه داده B2B (روتین مدیر محصول)

هر ماه پس از دریافت گزارش از Finance:

```sql
INSERT INTO business.b2b_revenue (month_jalali, month_date, source, amount_toman, notes)
VALUES
  ('1405-03', '2026-05-22', 'ISP_MCI', 850000000, 'invoice #12345'),
  ('1405-03', '2026-05-22', 'ISP_MTN', 720000000, ''),
  ('1405-03', '2026-05-22', 'Rubika',  2100000000, '')
ON CONFLICT (month_jalali, source) DO UPDATE
  SET amount_toman = EXCLUDED.amount_toman,
      notes        = EXCLUDED.notes,
      updated_at   = NOW();
```

**نکته:** `amount_toman` نه ریال. UI داشبورد فرض کرده عدد در تومان است.

## فرمول‌ها

| KPI | فرمول |
|-----|--------|
| Active user | `user_id != '' AND watch_duration >= 60` |
| DAU | `uniqExact(user_id)` در `toStartOfDay(now())` |
| MAU | همان در ۲۸ روز اخیر |
| Stickiness | `DAU / MAU × 100` |
| NET Toman | `gross_rial / 10 × 0.787` (کارمزد ۲۱.۳٪) |
| Trial→Paid 90d | کاربری که trial داشت در ۱۸۰–۹۰ روز قبل، plan paid خرید در ۹۰ روز بعد |
| Cart Abandonment | `1 − (Paid / Active Attempts)` |
| DAU WoW | `(this_week − last_week) / last_week × 100` |

## ⚠️ قواعد بحرانی

1. **`tbl_user_payment.amount` در ریال است.** همیشه `÷ ۱۰` برای نمایش تومان. NET = gross/۱۰ × ۰.۷۸۷.
2. **trial plan detection** بر اساس `p.name LIKE '%sub_7d%' OR '%trial%'`. اگر naming تغییر کرد، query‌های ROW 3 رو بازبینی کن.
3. **anonymous filter**: `user_id != '' AND user_id != 'total'` — string `'total'` آمیخته rows است نه null.
4. **timezone**: داشبورد روی Asia/Tehran ست شده. queryهای ClickHouse از `now()` server time استفاده می‌کنن — اگر سرور UTC است، می‌تونه ±۳:۳۰ ساعت آفست داشته باشه. در صورت لزوم: `toTimezone(created_at, 'Asia/Tehran')`.
5. **`unit: currencyIRR` استفاده نکن.** داشبورد قبلی این باگ رو داشت — مقدار رو ۱۰× بزرگ‌تر نشون می‌داد. این داشبورد divide در SQL انجام می‌ده و `unit: short` می‌ذاره.

## تست بعد از import

برای اطمینان از کار کردن queryها:

| Panel | چه چیزی باید ببینی |
|-------|----------------------|
| DAU امروز | یک عدد بین ۲۰۰۰–۴۰۰۰ |
| MAU 28d | ۲۰k–۳۵k |
| Stickiness | ۱۲٪–۲۵٪ |
| Cart Abandonment | حدود ۲۰–۳۰٪ (industry: ۷۰٪+ بد) |
| Anonymous Ratio | حدود ۳۵٪ (per memory) |
| ISP bar chart | داده اگر INSERT تاریخی اجرا شده باشد |

اگر همه‌چیز سفید شد، probable cause:
- datasource map نشده
- variable `${gateway:csv}` در MySQL syntax — اگر MySQL ds syntax مشکل داشت، `gateway_id IN (2,3)` رو hardcode کن
- `business.b2b_revenue` خالیه (داده وارد نشده)
