# DDM KPI Framework v3 (Trial-Centric Reframe)

**Date**: 31 May 2026 | **Status**: ✅ Locked
**Replaces**: kpi-framework-v2 (که trial blind-spot داشت)

---

## North Star Metric

**Net Monthly Revenue (تومان)**

> Baseline: 175M تومان/ماه (30 روز اخیر، تصحیح‌شده بعد از حذف پلن 32)
> Target 6M: **500M+ تومان/ماه** (با fix trial funnel realistic)

---

## یافته‌های Reframe بنیادی

### 1. Trial Onboarding = منشأ اصلی Loss

پلن 25 = اشتراک 7-روزه با voucher 100% رایگان (acquisition tool).

```
Trial Funnel (30 روز):
1,711 DRAFT (56% کل DRAFTs)
   ↓ (19% activation)
~325 activated
   ↓ (2.53% در 90 روز)
~8 paid plan خریدند
```

→ **97.5% trial کاربر هرگز paid نمی‌شه**. industry benchmark = 5-15%.

### 2. Real Checkout متفاوت با تصور قبلی

| متریک | v2 (اشتباه) | v3 (درست) |
|--------|-------------|-----------|
| Cart Abandonment | 90.5% (شامل trial) | 87.2% (non-trial only) |
| Checkout Completion | 9.5% | **12.8%** |
| Denominator | همه DRAFT | DRAFT خرید واقعی |

### 3. Catalog Explosion

15 پلن فعال (در databases-ref 9 پلن بود):

**Sub plans** (price.type=1):
- 2: 3-ماهه 882K — **CHAMPION 36.5% conv** ⭐
- 6: سالانه 3.528M — price shock 3.1% conv
- 19: ماهانه 980K — cannibalized 7.1% conv
- 20: 6-ماهه 1.764M — 11.9% conv
- 25: **trial 7-روزه (296K در DRAFT، 0 در ACTIVE با voucher)**
- 28: ~3M — 9.5% conv
- 29: 2M — 19.2% conv
- 31: 215K — 14.8% conv
- 32: **10M — حذف شد** (0 conv)

**Coin Packs** (price.type=2):
- 9: 100K — 10.1%
- 11: 400K — 15.9%
- 12: 990K — 29% ⭐ best coin pack
- 13: 750K — 19.5%
- 27: 10K — 10.4%
- 30: 50K — 4.1%

### 4. Self-Cannibalization

پلن 19 (ماهانه 980K) **5x بدتر** از پلن 2 (3-ماهه 882K). کاربر متوجه شده 3-ماهه ارزش بهتری داره و monthly رو reject می‌کنه. ولی UI ماهانه رو highlight می‌کنه — paradox.

### 5. Gateway & Platform Reality

- **myket**: 76% revenue (1,894 DRAFT، 191 paid، 8.2% completion)
- **cafebazaar**: 24% revenue (1,138 DRAFT، 62 paid، 4.8% completion)
- **failed = 2** (از 3,287) → gateway-internal مشکل ندارد
- Decision/price-shock در gateway = 92% abandonment

**Platform**:
- Android = 96.2% MAU (16,210)
- Web = 4.1% (693) - بدون payment endpoint
- rubika/splus = anonymous-only، 0 MAU شناسایی‌شده

**نتیجه**: پرداخت فقط Android. هر کاربر فقط از marketplace نصب-شده می‌تونه بخره.

---

## KPI v3 — 7 KPI در 3 Tier

### Tier 1 — Revenue Drivers

| # | KPI | Baseline | Target 6M | Owner | Tactic |
|---|-----|----------|-----------|-------|--------|
| 1 | **Net Monthly Revenue** ⭐ | 175M | **500M+** | Business | Combo |
| 2 | **Trial → Paid Conv** ⭐⭐ | 2.53% | 10% | Product/CRM | post-trial flow |
| 3 | **Trial Activation Rate** | 19% | 50% | Product/Eng | UX onboarding |

### Tier 2 — Quality Drivers

| # | KPI | Baseline | Target 6M | Owner | Tactic |
|---|-----|----------|-----------|-------|--------|
| 4 | **Real Checkout %** (non-trial) | 12.8% | 25% | Product | catalog default, price-presentation |
| 5 | **ARPPU (Sub Paid)** | 775K | 1M | Business | push 6-month/annual |
| 6 | **Repeat Purchase Rate (90d)** | 11.9% | 20% | CRM | renewal reminders |

### Tier 3 — Engagement Health

| # | KPI | Baseline | Target 6M | Owner |
|---|-----|----------|-----------|-------|
| 7 | **D7 Retention** | ~12% | 18% | Product |

---

## Time-Series پلن 25 (12 ماه)

| Month | DRAFT | Activated | Act % | Notes |
|-------|-------|-----------|-------|-------|
| 2025-11 | 1,459 | 246 | 16.9% | |
| 2025-12 | 1,830 | 313 | 17.1% | |
| **2026-01** | **4,407** | **1,048** | **23.8%** | ⬆️ peak — campaign? |
| **2026-02** | 2,150 | 306 | **14.2%** | ⬇️ regression — deploy? |
| 2026-03 | 3,442 | 694 | 20.2% | recovered |
| 2026-04 | 1,951 | 355 | 18.2% | |
| 2026-05 | 2,161 | 411 | 19.0% | |

**سؤالات pending**:
- ژانویه چه campaign موفقی بود؟ (replicate)
- فوریه چه چیزی deploy شد؟ (root-cause)

---

## محاسبه Path to 500M Revenue

```
امروز (175M):
  Sub Paid direct: ~150 users × 700K = 105M
  Coin packs:       ~30 users × 800K = 24M
  Subscription large (3mo/6mo/annual): 46M
  Trial revenue: 0 (همه voucher 100%)

6 ماه آینده (500M):
  Sub Paid direct: 350 × 1M (ARPPU↑) = 350M
  Coin packs:       60 × 1.2M = 72M
  Trial → Paid: 200 × 700K = 140M  ← biggest growth driver
  Total ≈ 562M
```

اعتبار مدل:
- Trial→Paid 2.53%→10% در 6 ماه با fix UX = realistic
- ARPPU 775K→1M با push annual = realistic
- ریسک: اگر trial fix فقط 5% (نه 10%) → target 400M (هنوز 2.3x)

---

## Action Plan (Operational)

### P1 — Trial → Paid Funnel (Biggest Leverage)
- D5/D6/D7 reminder push: "trial شما تمام می‌شه"
- D7 paywall: first-paid 50% off
- post-trial 14-day discounted window
- D3 upsell prompts: "این feature فقط در paid plan"

### P2 — Trial Activation UX
- Auto-apply voucher (حذف copy/paste)
- In-app activation flow (نه redirect)
- Clear single-CTA

### P3 — Catalog Surgery
- Default در UI = **پلن 2** (3-ماهه)
- Demote پلن 19 (monthly cannibalization)
- Simplify 15 → 5 پلن core
- Investigate پلن‌های جدید با low conv

### P4 — Real Checkout
- Price-presentation با fee marketplace قبل از redirect
- gateway-fix محدود (failed≈0)

---

## Dashboard Updates پیشنهادی

### ROW 1 — Daily Pulse (cleanup)
- Watch Hours = ساعت ✓
- Avg Min/User = دقیقه ✓
- Yesterday Stickiness → **حذف**
- Rolling Stickiness → **28-day** (نه 30) + sparkline 90d

### ROW جدید — Data Health
- Anonymous Ratio % (~35% baseline)
- alert threshold > 45%

### ROW جدید — Trial Funnel ⭐
- Trial DRAFTs (daily)
- Trial Activation %
- Trial → Paid % (cohort)
- Activation by month (time-series)

### ROW جدید — Catalog Performance
- Per-plan conversion %
- Per-plan revenue contribution
- Champion/Loser highlight

---

## ریسک‌های Framework

1. **Trial flow black-box**: بدون audit از onboarding، 81% pre-activation drop ریشه‌اش معلوم نیست
2. **Feb regression unexplained**: اگر تکرار بشه، target 500M در خطر
3. **Catalog cleanup risk**: حذف پلن‌های low-conv ممکنه segment کوچک high-value upset کنه (need cohort)
4. **Trial expire UX unknown**: 7 روز بعد چی می‌بیند کاربر؟ silent expire؟ paywall؟ degraded?
5. **Identity bridge 30%**: KPI cross-DB کم‌اعتبار است
6. **Anonymous 35%**: KPI engagement under-report

---

## Files Referenced
- `DDM/score-reference.md` — gamification spec
- `DDM/docs/databases-reference.md` — schema 3DB
- `DDM/docs/kpi-framework-v2.md` — قبلی (deprecated)
- `DDM/ddm-business-dashboard.json` — 28 پنل، نیاز به update
