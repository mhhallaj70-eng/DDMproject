# DDM KPI Framework v2 (Recalibrated)

**Date**: 25 May 2026 | **Status**: ✅ Locked with real data
**Replaces**: kpi-framework-v1 (baseline‌های حدسی غلط بود)

---

## North Star Metric

**Net Monthly Revenue (تومان)**

> چرا: DDM در فاز چالش monetization است. NSM باید مالی باشد نه engagement.
> Baseline: 210M تومان/ماه (میانگین 12 ماه)
> Target 6M: **420M تومان/ماه** (2x)

---

## استراتژی 6 ماهه (اولویت A→B→D→C)

| اولویت | حوزه | leverage تخمینی |
|--------|------|------------------|
| **A** | **Fix Checkout** (90.5% abandonment) | 2.5x revenue با fix tactical |
| B | افزایش ARPPU (push to annual + larger coin packs) | 1.3x |
| D | Retention (88% churn after first buy) | 1.2x long-term |
| C | Mass Acquisition | فقط بعد از A، B، D |

---

## 7 KPI در 3 Tier

### Tier 1 — Revenue Drivers

| # | KPI | Baseline (May 2026) | Target (6M) | Owner | Tactic |
|---|-----|---------------------|-------------|-------|--------|
| 1 | **Net Monthly Revenue** ⭐ | 210M تومان | **420M** | Business | همه tier 1،2 |
| 2 | **Checkout Completion Rate** | 9.5% | **25%** | Product/Eng | UX checkout، payment retry، gateway fallback |
| 3 | **Sub Paid Conversion** (paid only) | 1.14% | **2.5%** | Product | onboarding paywall، first-purchase incentive |

### Tier 2 — Quality Drivers

| # | KPI | Baseline | Target (6M) | Owner | Tactic |
|---|-----|----------|-------------|-------|--------|
| 4 | **ARPPU (Sub Paid)** | 775K تومان | **1M** | Business | push 6-month/annual، bundle |
| 5 | **Repeat Purchase Rate (90d)** | 11.9% | **20%** | Product/CRM | win-back emails، renewal reminders |
| 6 | **Voucher → Paid Conversion** | TBD | 15% | Business | voucher trial → paid conversion flow |

### Tier 3 — Engagement Health

| # | KPI | Baseline | Target (6M) | Owner |
|---|-----|----------|-------------|-------|
| 7 | **D7 Retention** | ~12% (ClickHouse cohort) | 18% | Product |

---

## مقایسه با v1 (Framework قبلی)

| KPI v1 | Baseline v1 | Target v1 | واقعیت | تصمیم v2 |
|--------|-------------|-----------|--------|----------|
| D1 Retention | <20% | 28-30% | باید با cohort دقیق بسنجیم | ⬇️ Tier 3 |
| D7 Retention | ~12% | 18-20% | منطقی | ✅ نگه داشتیم (KPI 7) |
| D30 Retention | ~5% | 10-12% | باید سنجیده شود | ⏸️ پارک |
| Conversion to Payer | 0.5-1% | 2-2.5% | **1.14% paid (درست بود)** | ✅ KPI 3 |
| ARPU | TBD | 22-25K | فهم اشتباه بود؛ ARPU≠ARPPU | تبدیل به ARPPU 775K → 1M |
| **— جدید —** | — | — | **NSM** | KPI 1 |
| **— جدید —** | — | — | **Checkout 9.5%** | KPI 2 (مهم‌ترین) |
| **— جدید —** | — | — | **Repeat 12%** | KPI 5 |

---

## محاسبه Path to 420M Revenue

```
امروز:
  Sub Paid: 184 users × 775K = 142M
  Coin:      40 users × 1.04M = 42M
  Sub Voucher: 320 users × 0 = 0
  Total ≈ 184M (sub) + 42M (coin) = 226M ≈ rounded 210M

6 ماه آینده (با fix checkout + ARPPU):
  Sub Paid: 350 users × 1M = 350M     ← 2x via checkout fix + ARPPU up
  Coin:      60 users × 1.2M = 72M     ← +50% via volume promo
  Total = 422M
```

**اعتبار مدل**:
- Checkout fix 9.5%→25% → realistic؟ مرجع e-commerce ایران benchmark ~30%، رسیدن به 25% در 6 ماه possible
- ARPPU 775K→1M → push to annual + 6-month, با targeting whales
- ریسک: اگر checkout fix فقط 5 درصد سرعت بگیرد (15% نه 25%)، target می‌شه 300M (هنوز 1.5x)

---

## ریسک‌های فریم‌ورک

1. **Identity Bridge 30% فقط**: KPI #3 (conversion) از MAU (ClickHouse) به Payer (MySQL) join داره. اگر 70% payer غیر-joinable باشه، conversion under-report می‌شه.
2. **MAU 16K under-count**: 35% ترافیک anonymous. واقعی شاید 22K → conversion 1.14% می‌شه 0.84%.
3. **Voucher Activation Spam**: 320 voucher activate/month خیلی زیاد است. ممکنه fraud یا abuse باشد. باید source-of-voucher بررسی شود.
4. **Channel Concentration**: 8 whale در 10K coin pack = 5% revenue کل. هر کدوم بره، 5% damage.
5. **Feb 2026 spike (603M)**: ناشناخته. اگر یک‌بار-بار بود، target 420M محتاطانه است. اگر تکرارشدنی، می‌توان aim بالاتر کرد.

---

## Watch List (متریک‌های نظارتی، نه target)

- **Cart Abandonment per Gateway** — کدوم gateway بدترین completion rate؟ (کوئری B دوباره با سینتکس ساده‌تر)
- **Voucher Activation Source** — کجا voucher‌ها distribute می‌شن؟
- **Watch Hours per Sub Payer** — آیا pay می‌کنه و engage هم می‌کنه؟
- **Time-to-First-Pay** — روزها از signup تا اولین خرید
- **DAU/MAU per via** — کدوم محصول convert می‌کنه

---

## Action Items فوری

1. ✅ ثبت framework در docs (این فایل)
2. ⏳ آپدیت memory `project_ddm_kpi_framework.md`
3. ⏳ کوئری B (Checkout per Gateway) — سینتکس ساده‌تر:
   ```sql
   SELECT IFNULL(gateway_id, 0) AS gw,
     SUM(IF(status=12,1,0)) AS drafts,
     SUM(IF(status=41 AND amount>0,1,0)) AS paid,
     SUM(IF(status=31,1,0)) AS failed
   FROM tbl_user_payment
   WHERE platform_id=1 AND created_at >= UNIX_TIMESTAMP(NOW() - INTERVAL 30 DAY)
   GROUP BY gw;
   ```
4. ⏳ مرحله 5 (Target final) — هم‌سویی با stakeholder
5. ⏳ Dashboard panel برای 7 KPI top-level (Executive Summary view)
