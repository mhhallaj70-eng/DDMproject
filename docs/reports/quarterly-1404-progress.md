# گزارش فصلی ۱۴۰۴ — سند پیشرفت

**تاریخ آخرین آپدیت**: 2 June 2026 (پایان سشن ۲)
**Status**: 🟡 بخش ۵ + ۷ + Attribution Strategy بسته. بخش ۶ skip شد. بخش ۸-۱۰ pending سشن بعد. **Strategy reset:** ۱۴۰۵ = maintenance year (نه optimization).

---

## Definitions (Locked)

| متریک | تعریف |
|--------|--------|
| Active User | کاربر ثبت‌شده با ≥۱ session دارای watch ≥۶۰ ثانیه در ۳۰ روز |
| Anonymous | حذف شد (user_id = empty) |
| Conversion | هر سه — Trial→Paid، Checkout Completion، Overall Payer — با تفکیک |
| Comparison | QoQ درون ۱۴۰۴، با ستون YoY برای Q1 |

---

## Data Coverage

| فصل | ClickHouse | Cafebazaar | Myket | Subscription DB | ISP Spreadsheet |
|------|-------------|-------------|--------|-------------------|------------------|
| Q1 بهار | ❌ | ❌ | ❌ | ❌ | ✓ |
| Q2 تابستان | ⚠️ از 14 Jul | ❌ | ❌ | ✓ | ✓ |
| Q3 پاییز | ✓ | ⚠️ partial | ❌ | ✓ | ✓ |
| Q4 زمستان | ✓ | ✓ | ⚠️ partial | ✓ | ⚠️ فقط Dey |

**Scope تأیید نشده هنوز**: option 1 (Q2-Q4 فقط) یا option 2 (کل سال با gap)

---

## Context بیرونی (مهم برای CEO Narrative)

- **اغتشاشات دی ۱۴۰۴** → اینترنت ملی → spike Q4 (Dec-Jan)
- **آغاز جنگ ۹ اسفند ۱۴۰۴** → اینترنت ملی → spike قوی‌تر (Feb-Mar)

⚠️ **Q4 رشد عمدتاً driven by external factors، نه product wins**. باید shafāf گفته بشه.

---

## بخش ۲ — User Growth ✅

### MAU per Quarter (Unique, registered + watch ≥60s)

| فصل | Unique MAU | Δ |
|------|-------------|----|
| Q2 تابستان | 28,914 | baseline |
| Q3 پاییز | 20,730 | **−28%** 🚨 |
| Q4 زمستان | 33,031 | **+59% vs Q3 / +14% vs Q2** |

### MAU ماهانه (نمونه)

| ماه | MAU | DAU avg | Stickiness | Watch Hours |
|-----|-----|---------|------------|-------------|
| Jul 2025 | 15,590 | 3,470 | 22.3% ⭐ | 57,179 |
| Aug 2025 | 19,363 | 3,204 | 16.5% | 86,475 |
| Sep 2025 | 15,323 | 2,366 | 15.4% | 60,208 |
| Oct 2025 | 11,277 | 1,670 | 14.8% | 42,334 |
| Nov 2025 | 11,677 | 1,851 | 15.9% | 47,446 |
| Dec 2025 | 12,052 | 1,828 | 15.2% | 48,121 |
| Jan 2026 | 16,320 | 2,014 | 12.3% 🚨 | 38,398 |
| Feb 2026 | 13,705 | 2,377 | 17.3% | 57,076 |
| Mar 2026 (20d) | 17,732 | 3,875 ⭐ | 21.9%\* | 76,826 |

### Per-Via Breakdown

| محصول | Q2 users | Q3 users | Q4 users | تحلیل |
|--------|----------|----------|----------|--------|
| VOD | 23,484 | 17,208 | 26,929 | V شکل، recovered |
| UGC (آسمون) | 22,315 | 16,560 | 29,379 | recovered + بیشتر از Q2 ⭐ |
| Cinema | 209 | 258 | 626 | **+200%** — small but growing ⭐ |
| Magazine | 2,286 | 1,519 | 3,171 | recovered ولی engagement ضعیف |
| TV | 154 | 15 | **0** | 🪦 paused (no content) |

**Magazine paradox**: Q4 = 3,171 user × 95.9h کل = **1.8 دقیقه/user/فصل** → kill یا redesign

**TV**: paused علناً به دلیل نبود محتوای پخش زنده

### Installs

**Cafebazaar Q4 (تقریبی)**:
- آذر 12-30: 2,158 | دی: 4,776 | بهمن: 3,648 | اسفند 1-28: 5,738
- **مجموع Q4: ~16.3K | میانگین: 136/روز**

**Myket**: فقط 17 روز آخر Q4 + Q1 1405 (insufficient for quarterly)

### نواقص باقی‌مانده

- [ ] GA4 monthly breakdown (DAU/MAU/New users per month CSV)
- [ ] Q1 + Q2 install data (نداریم)
- [ ] New users monthly از ClickHouse

---

## بخش ۳ — Revenue ✅ (NET reconciled)

### کشف بزرگ: DDM کسب‌وکار ۴-جریانی، ولی in-app < ۱٪

⚠️ **DB amount در ریال است (نه تومان)** — databases-reference اصلاح شد. همه اعداد قبلی ۱۰× بزرگ‌نمایی.

### Total Revenue per Quarter (میلیون تومان، NET)

| Source | Q1 | Q2 | Q3 | Q4 | جمع |
|--------|-----|-----|-----|-----|-----|
| **ISP Traffic** | 2,726 | 7,277 | 4,525 | 929\* | 15,457+ |
| **Rubika Content** | 176 | 1,216 | 1,358 | 4,559 | 7,309 |
| **In-App (NET)** | 36 | 36 | 29 | **55** | **155** |
| **Ads (KikoMax)** | n/a | 45 | 0 | 0 | 45 |
| **مجموع** | **~2,938** | **~8,574** | **~5,912** | **~5,543\*** | **~22,970** |

\* Q4 ISP: فقط Dey ثبت‌شده. Bahman+Esfand pending invoice.

### In-App per Quarter (NET، authoritative)

| فصل | Cafebazaar | Myket | TOTAL NET |
|------|------------|--------|------------|
| Q1 بهار | 19.61M | 16.05M | **35.66M** |
| Q2 تابستان | 19.71M | 16.31M | **36.02M** |
| Q3 پاییز | 14.23M | 14.91M | **29.14M** |
| Q4 زمستان | 15.93M | 38.59M | **54.52M** (+87٪) |
| **سال** | **69.48M** | **85.86M** | **~۱۵۵M Toman** |

منابع authoritative:
- Cafebazaar xlsx (col 86: سهم توسعه‌دهنده پس از کارمزد)
- Myket CSV (دستون بدهکار/بستانکار = NET dev share)
- DB Gross × ۷۸.۷٪ (validate ratio)

### Plan 32 = high-value tier (نه whale)

- DB amount ۱۰,۰۰۰,۰۰۰ ریال = **۱M تومان per txn** (نه ۱۰M)
- ۲۰ تراکنش / ۱۳ کاربر منحصر = ۲۰M Toman gross
- ARPPU = ۱.۵M Toman ≈ ۲۰× ARPPU عادی
- روی Cafebazaar محصول لیست نیست → custom/internal flow

### Reconciliation Files

- `docs/revenue/cafebazaar-1404-monthly.md` — تحلیل کامل xlsx
- `docs/revenue/myket-1404-monthly.md` — تحلیل کامل CSV
- `docs/revenue/in-app-reconciliation-1404.md` — cross-source validation

### Checkout Completion

| فصل | DRAFT | Paid | Completion |
|------|-------|------|------------|
| Q2 | 7,413 | 332 | 4.28% |
| Q3 | 5,719 | 373 | 5.73% |
| Q4 | 13,167 | 1,082 | **6.78%** |

روند مثبت ولی هنوز پایین (industry target: 25-30٪).

### Gateway Mix (Clean, type 1+2)

| Gateway | Q2 | Q3 | Q4 |
|---------|-----|-----|-----|
| myket | 148.9M | 192.0M | 483.6M |
| cafebazaar | 169.5M | 185.4M | 203.1M |

(Zarinpal rows in original Q9 = type=3 admin/bulk entries — حذف شد)

### ISP Traffic Insights

| Persian Month | Quarter | Payable (M Toman) |
|----------------|---------|--------------------|
| فروردین | Q1 | 770 |
| اردیبهشت | Q1 | 914 |
| خرداد | Q1 | 1,042 |
| **تیر** | Q2 | **3,416** ⭐ PEAK |
| مرداد | Q2 | 2,321 |
| شهریور | Q2 | 1,540 |
| مهر | Q3 | 1,766 |
| آبان | Q3 | 1,400 |
| آذر | Q3 | 1,359 |
| دی | Q4 | 929 |
| بهمن | Q4 | pending |
| اسفند | Q4 | pending |

**نکته:** Q2 peak (تابستان) → افت ادامه‌دار. باید بفهمیم: نرخ کاهش، حجم کاهش، یا تغییر قرارداد.

### Rubika Insights

| Persian Month | Quarter | Revenue (M Toman) |
|----------------|---------|--------------------|
| فروردین تا خرداد | Q1 | 176 (total) |
| تیر-شهریور | Q2 | 1,216 (total) |
| مهر-آذر | Q3 | 1,358 (total) |
| دی | Q4 | 1,283 |
| بهمن | Q4 | 1,212 |
| **اسفند** | Q4 | **2,064** ⭐ PEAK |

Q3→Q4 = +236٪. درایور: war/uprising → اینترنت ملی → Rubika traffic spike. **Long-term contract، ادامه‌دار** → ریسک کم.

---

## بخش ۴ — Content (شروع نشده)

نیاز به:
- CMS export per month
- Tag «اختصاصی» و «دوبله»
- Top content per quarter (از ClickHouse — کوئری آماده)
- Genre breakdown

---

## بخش ۵ — Features & Product ✅ (سشن ۲)

### Headline
۱۴۰۴ سال **product-light** بود. ۳ release اپ در کل سال. هیچ launch گیمیفیکیشن جدید.

### Cadence
| فصل | Release | تاریخ | Gap |
|------|---------|--------|------|
| Q1 | 5.2.0 | ۱۴۰۴/۰۳/۰۷ | Cinema launch |
| Q2 | 5.3.0 | ۱۴۰۴/۰۵/۲۱ | Asemon revamp + Profile (~۲.۵ ماه gap) |
| Q3 | — | — | **silent quarter** (تصمیم استراتژیک) |
| Q4 | 5.3.1 | ۱۴۰۴/۱۱/۰۸ | Engagement layer (~۵.۵ ماه gap) |
| پس از ۸ بهمن | — | — | freeze (دوره war) |

### Strategic Position
- گیمیفیکیشن core همگی **قبل از ۱۴۰۴** build شده بود.
- ۱۴۰۴ یعنی **deepening، نه expansion**.
- پیشنهاد ۱۴۰۵: **«Sweat the existing assets»** — adoption baseline، funnel، optimization، نه launch جدید.

### Major Findings
1. **Attribution impossible** — هیچ feature flag/A/B test نداریم. impact هر فیچر unprovable.
2. **5.3.1 stickiness uplift غیرقابل تفکیک از war effect** (launch ۸ بهمن، war ۹ اسفند).
3. **Cinema +۲۰۰٪** ولی base کوچک (209→626). decision pending: scale up یا keep small.
4. **Adoption metric گیمیفیکیشن نداریم** — claim "زیر بار نرفته" hypothesis است نه fact.

### Open Questions (موضوع سشن‌های آینده)
- [ ] Non-tech levers ۱۴۰۵ (content، partnership، pricing، marketing)
- [ ] Restoration plan تیم + budget
- [ ] External messaging — maintenance year بدون decline signal
- [ ] Post-restoration roadmap

---

## بخش ۷ — Team Status ✅ (سشن ۲)

### Headline
تیم DDM در حالت **maintenance mode**. توسعه فعال متوقف. **استراتژی ۱۴۰۵ = maintenance year، نه optimization.**

### ساختار فعلی (۴ نفر توسعه)
- ۱ PM (کاربر)
- ۱ Tech Lead
- ۱ Backend Dev
- ۱ Android Dev

### تعدیل Q4 ۱۴۰۴: −۵ نفر
- ۱ Frontend Dev
- ۲ UI/UX Designer
- ۱ APM
- ۱ Backend Dev

علت: شرایط جنگ + اقتصادی کشور.

### Critical Risks
- **عدم پرداخت منظم بیمه و حقوق** → بالاترین retention risk
- **Tech Lead/Backend trek** → catastrophic (سرویس متوقف می‌شود)
- **بدون Frontend/Designer** → هیچ UI work ممکن نیست
- **بدون APM** → بار PM فقط روی یک نفر

### Implication استراتژیک
- ۱۴۰۵ optimization، Attribution، A/B test، گیمیفیکیشن tests، Cinema scale-up — **همه deferred**
- اولویت ۱۴۰۵: service continuity + B2B contracts (ISP + Rubika) + team stabilization + non-tech levers
- Restoration ۳ نفر minimum برای اجرای استراتژی بعدی

### Attribution Strategy Status
سند `docs/strategy/attribution-measurement-1405.md` → **PAUSED**، منوط به restoration.

---

## بخش‌های ۵-۱۰ (سشن‌های بعد)

- ۵ Features
- ۶ Roadmap
- ۷ Team
- ۸ Traffic per ISP (داریم — Sheet بالا)
- ۹ Risks
- ۱۰ Q1 1405 plan

---

## یافته‌های کلیدی برای CEO Narrative

1. **DDM کسب‌وکار ۴-جریانی است** — in-app < ۱۰٪. ISP + Rubika جریان اصلی.
2. **Q4 رشد ۸۲٪ in-app — رشد واقعی** (نه فقط external).
3. **Rubika +۲۳۶٪ Q3→Q4** — strongest driver. ولی external (war).
4. **ISP افت Q2→Q4** — از 7.3B به 929M Dey. باید explain شه.
5. **Plan 32 whales** — hidden segment، potential 5-10x scaling.
6. **TV dead + Magazine candidate for kill** — portfolio cleanup.
7. **Stickiness ژانویه ۱۲.۳٪** — acquisition بدون retention.
8. **Q1 ۱۴۰۴ data gap** — باید shafāf باشد در گزارش.

---

## Open Questions

- [ ] Bahman + Esfand ISP کی invoice می‌شه؟ (Finance)
- [ ] ISP Q2→Q3 افت ۳۸٪ — قرارداد یا حجم؟
- [ ] Plan 32 same-day double buys — UX bug یا intentional؟
- [ ] Trial activation Feb regression — root cause پیدا شده؟
- [ ] Magazine — kill or redesign؟
