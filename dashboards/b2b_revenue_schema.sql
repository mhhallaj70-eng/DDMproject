-- =====================================================================
-- B2B Revenue Table — Manual Monthly Entry
-- Database: Score DB (PostgreSQL) — همون datasource ${DS_POSTGRES}
-- نگهداری: مدیر محصول (DDM)
-- =====================================================================

CREATE SCHEMA IF NOT EXISTS business;

CREATE TABLE IF NOT EXISTS business.b2b_revenue (
    id              SERIAL PRIMARY KEY,
    month_jalali    VARCHAR(8)  NOT NULL,           -- '1404-09', '1405-01'
    month_date      DATE        NOT NULL,           -- اولین روز ماه میلادی (برای plot)
    source          VARCHAR(20) NOT NULL,           -- 'ISP_MCI' | 'ISP_MTN' | 'Rubika'
    amount_toman    BIGINT      NOT NULL,           -- تومان (نه ریال)
    notes           TEXT,
    inserted_at     TIMESTAMPTZ DEFAULT NOW(),
    updated_at      TIMESTAMPTZ DEFAULT NOW(),
    CONSTRAINT uq_b2b_month_source UNIQUE (month_jalali, source),
    CONSTRAINT chk_source CHECK (source IN ('ISP_MCI','ISP_MTN','Rubika'))
);

CREATE INDEX IF NOT EXISTS idx_b2b_month_date ON business.b2b_revenue(month_date);
CREATE INDEX IF NOT EXISTS idx_b2b_source ON business.b2b_revenue(source);

-- =====================================================================
-- نمونه INSERT — ماهانه این پترن رو تکرار کن
-- =====================================================================

-- ماهانه (مثال: اسفند ۱۴۰۴):
INSERT INTO business.b2b_revenue (month_jalali, month_date, source, amount_toman, notes)
VALUES
  ('1404-12', '2026-02-20', 'ISP_MCI', 0,        'TBD — invoice not yet'),
  ('1404-12', '2026-02-20', 'ISP_MTN', 0,        'TBD — invoice not yet'),
  ('1404-12', '2026-02-20', 'Rubika',  2060000000, 'spike post 9-Esfand war')
ON CONFLICT (month_jalali, source) DO UPDATE
  SET amount_toman = EXCLUDED.amount_toman,
      notes        = EXCLUDED.notes,
      updated_at   = NOW();

-- =====================================================================
-- داده تاریخی ۱۴۰۴ (از گزارش فصلی) — یک‌بار وارد کن
-- منبع: docs/reports/quarterly-1404-report.md
-- =====================================================================

INSERT INTO business.b2b_revenue (month_jalali, month_date, source, amount_toman, notes) VALUES
  -- Q1 بهار ۱۴۰۴ (تخمینی، چون ClickHouse از mid-July شروع شده)
  ('1404-Q1', '2025-03-21', 'ISP_MCI', 1363000000, 'Q1 lump — split MCI/MTN unknown'),
  ('1404-Q1', '2025-03-21', 'ISP_MTN', 1363000000, 'Q1 lump — split MCI/MTN unknown'),
  ('1404-Q1', '2025-03-21', 'Rubika',  176000000,  ''),
  -- Q2 تابستان
  ('1404-Q2', '2025-06-22', 'ISP_MCI', 3638500000, 'peak summer — split estimate'),
  ('1404-Q2', '2025-06-22', 'ISP_MTN', 3638500000, 'peak summer — split estimate'),
  ('1404-Q2', '2025-06-22', 'Rubika',  1216000000, ''),
  -- Q3 پاییز
  ('1404-Q3', '2025-09-23', 'ISP_MCI', 2262500000, ''),
  ('1404-Q3', '2025-09-23', 'ISP_MTN', 2262500000, ''),
  ('1404-Q3', '2025-09-23', 'Rubika',  1358000000, ''),
  -- Q4 زمستان (ISP فقط دی ثبت شده، Bahman+Esfand هنوز invoice نشده)
  ('1404-Q4', '2025-12-22', 'ISP_MCI', 464500000,  'فقط دی — Bahman/Esfand pending'),
  ('1404-Q4', '2025-12-22', 'ISP_MTN', 464500000,  'فقط دی — Bahman/Esfand pending'),
  ('1404-Q4', '2025-12-22', 'Rubika',  4559000000, 'huge spike from war')
ON CONFLICT (month_jalali, source) DO NOTHING;

-- =====================================================================
-- Query تست — جمع per source ۱۲ ماه اخیر
-- =====================================================================
-- SELECT source, SUM(amount_toman)/1e9 AS billion_toman
-- FROM business.b2b_revenue
-- WHERE month_date >= NOW() - INTERVAL '365 days'
-- GROUP BY source ORDER BY billion_toman DESC;
