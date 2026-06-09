# گزارش عملکرد سال ۱۴۰۴ — دیدیمون

**نسخه:** پیش‌نویس سشن ۱
**تاریخ:** خرداد ۱۴۰۵
**Status:** بخش ۲ + ۳ کامل. بخش‌های ۴-۱۰ در دست تهیه.
**Data scope:** Q2-Q4 ۱۴۰۴ (Q1 به دلیل عدم وجود داده ClickHouse / instrumentation محدودیت دارد)

---

## ⚡ خلاصه مدیریتی (Preliminary)

نیم‌سال دوم ۱۴۰۴ برای DDM یک سال **دوسیمایی** بود:

**کسب‌وکار B2B (~۹۹.۳٪ درآمد) رشد و افت داشت:**
- ISP traffic از peak تابستان (۷.۳B Toman) به Q4 افت کرد
- Rubika جایگزین قوی شد: +۲۳۶٪ Q3→Q4 (۴.۵۶B Toman)
- جمع B2B نیم‌سال دوم ≈ ۱۹.۸ میلیارد تومان

**کسب‌وکار B2C (in-app ~۰.۷٪) — کوچک ولی رشد قوی Q4:**
- Q4 in-app NET = ۵۴.۵M Toman (+۸۷٪ vs Q3 ۲۹.۱M)
- سالانه in-app = ~۱۵۵M تومان NET (پس از کارمزد مارکت + VAT + مالیات)
- MAU سال ۳۳K در Q4 (peak)
- **رشد عمدتاً driven by external factors** (اغتشاش دی + جنگ ۹ اسفند → اینترنت ملی)
- **اسفند ۱۴۰۴ Myket = ۲۲.۳M Toman تک‌ماه** = ۳.۱× میانگین — صریح‌ترین spike

**یافته‌های مهم برای تصمیم:**
1. DDM یک کسب‌وکار B2B-heavy است — تنوع‌بخشی به جریان درآمد in-app اولویت استراتژیک باید باشد
2. Plan 32 high-value tier — ۱۳ کاربر، ۱M Toman per txn، ۲۰× ARPPU عادی. potential scaling اگر UI visible شه.
3. TV product مرده (هیچ پخش زنده‌ای نداشتیم)
4. Magazine ضعیف‌تر از انتظار (۱.۸ دقیقه/user/فصل) — kill یا redesign
5. Cinema رشد small ولی consistent (+۲۰۰٪ Q3→Q4)
6. Stickiness ژانویه ۱۲.۳٪ بدترین سال — acquisition بدون retention
7. **Content shift**: کودک → K-Drama. سرمایه‌گذاری ۵۰۲M Toman دوبله (۴۰ عنوان). **صفر محتوای ایرانی** در top سال.

---

## ۲. رشد کاربران (User Growth)

### Active Users (registered + watch ≥60s)

| فصل | Unique MAU | تغییر | درایور |
|------|-------------|--------|---------|
| Q2 تابستان | 28,914 | baseline | natural peak |
| Q3 پاییز | 20,730 | −28٪ | شروع مدرسه/دانشگاه |
| Q4 زمستان | 33,031 | +59٪ vs Q3 | اغتشاش دی + جنگ ۹ اسفند (external) |

### Engagement (per Quarter)

| Metric | Q2 | Q3 | Q4 |
|---------|-----|-----|-----|
| Watch Hours | 191,716 | 134,869 | 187,253 |
| Hours/User | 6.6 | 6.5 | 5.7 |
| DAU avg (آخرین ماه) | 2,366 (Sep) | 1,828 (Dec) | 3,875 (Mar) ⭐ |
| Stickiness (آخرین ماه) | 15.4٪ | 15.2٪ | 21.9٪\* |

\* Q4 hours/user −۱۴٪ → رشد extensive بود نه intensive. کاربر بیشتر، تماشای کم‌تر.

### Per-Product (via)

| محصول | Q2 users | Q3 users | Q4 users | روند |
|--------|----------|----------|----------|------|
| VOD | 23,484 | 17,208 | 26,929 | بازگشت |
| UGC (آسمون) | 22,315 | 16,560 | 29,379 | بازگشت + رشد |
| Cinema | 209 | 258 | **626** | +200٪ ⭐ |
| Magazine | 2,286 | 1,519 | 3,171 | recovered ولی engagement ضعیف |
| TV | 154 | 15 | 0 | متوقف (نبود محتوا) |

### نکات حیاتی

- **Stickiness ژانویه ۱۲.۳٪** (بدترین سال): کاربر اومد، نگه نداشتیم. کمپین/شوک خارجی acquisition داد ولی habit نه.
- **Cinema spike**: ۲۰۹→۶۲۶ (پایه کم ولی رشد ۳x). نقطه روشن.
- **Magazine paradox**: ۳,۱۷۱ کاربر × ۹۵.۹ ساعت کل = **۱.۸ دقیقه per user در کل فصل**. browse-and-skip بدون engagement.

---

## ۳. درآمد (Revenue)

### Total Revenue per Quarter (میلیون تومان، NET)

| Source | Q1 | Q2 | Q3 | Q4 | جمع |
|--------|-----|-----|-----|-----|-----|
| **ISP Traffic** (MCI/MTN) | 2,726 | 7,277 | 4,525 | 929\* | 15,457+ |
| **Rubika Content** | 176 | 1,216 | 1,358 | 4,559 | 7,309 |
| **In-App** (net dev share) | 36 | 36 | 29 | **55** | **155** |
| **Ads** | n/a | 45 | 0 | 0 | 45 |
| **مجموع** | **~2,938** | **~8,574** | **~5,912** | **~5,543\*** | **~22,970** |

\* Q4 ISP: فقط Dey ثبت شده. Bahman + Esfand هنوز invoice نشده، تخمین واقعی Q4 ≈ ۸ میلیارد تومان

⚠️ **اصلاح مهم**: DB amount در ریال ذخیره می‌شه نه تومان. databases-reference نادرست بود. اعداد In-App بر مبنای گزارش رسمی Cafebazaar (xlsx) + Myket (CSV) → سهم توسعه‌دهنده پس از کارمزد مارکت، VAT، مالیات، کارمزد بانکی. این درآمد واقعی است که به حساب DDM می‌نشیند.

⚠️ **In-App share = ۰.۴٪ کل**. DDM در عمل کسب‌وکار B2B است.

### تحلیل جریان‌های اصلی

**ISP Traffic** (peak تابستان، روند نزولی):
- تیر ۱۴۰۴ = ۳.۴B Toman (peak تک‌ماه)
- مهر-آذر در حال افت
- باید بفهمیم: نرخ ISP تغییر کرد؟ حجم traffic کم شد؟ قرارداد تغییر کرد؟

**Rubika** (long-term contract، رشد قوی Q4):
- اسفند ۱۴۰۴ = ۲.۰۶B Toman تک‌ماه ⭐
- +۲۳۶٪ Q3→Q4
- درایور: war/uprising → اینترنت ملی
- قرارداد طولانی‌مدت و ادامه‌دار → ریسک تمدید پایین

**In-App** (small share، رشد واقعی):

از گزارش رسمی Cafebazaar xlsx + Myket CSV (NET = پولی که به حساب DDM نشست، تومان):

| فصل | Cafebazaar Net | Myket Net | **TOTAL Net** | Δ |
|------|----------------|------------|----------------|---|
| Q1 بهار | 19.6M | 16.05M | **35.66M** | baseline |
| Q2 تابستان | 19.71M | 16.31M | **36.02M** | flat |
| Q3 پاییز | 14.23M | 14.91M | **29.14M** | -19٪ |
| Q4 زمستان | 15.93M | 38.59M | **54.52M** | **+87٪** 🚀 |
| **کل سال** | **69.48M** | **85.86M** | **~۱۵۵M** | |

📁 جزئیات تفکیکی + cross-source validation:
- `docs/revenue/cafebazaar-1404-monthly.md`
- `docs/revenue/myket-1404-monthly.md`
- `docs/revenue/in-app-reconciliation-1404.md` ← cross-source proof

**Validation (سه منبع، یک نتیجه):**
- DB Gross ÷ ۱۰ = ۱۹۷M Toman gross
- × ۷۸.۷٪ (کارمزد ~۲۱٪) = ۱۵۵M Toman net
- Xlsx + CSV نهایی Net = ۱۵۵M Toman ✓
- نسبت Net/Gross هر دو مارکت = ۷۸.۶٪ - ۷۸.۸٪ (سازگار)

**Myket ماهانه — اسفند peak:**

| ماه | Net (Toman) | نسبت به میانگین |
|-----|--------------|------------------|
| فروردین | 4.1M | -42٪ |
| اردیبهشت | 4.0M | -44٪ |
| خرداد | 8.0M | +13٪ |
| تیر | 5.9M | -17٪ |
| مرداد | 4.7M | -34٪ |
| شهریور | 5.7M | -20٪ |
| مهر | 5.3M | -25٪ |
| آبان | 4.0M | -44٪ |
| آذر | 5.6M | -21٪ |
| دی | 9.5M | +33٪ (اغتشاش) |
| بهمن | 6.8M | -4٪ |
| **اسفند** | **22.3M** ⭐ | **+213٪ (جنگ)** |

اسفند ۱۴۰۴ تنها ۲۲.۳M Toman از Myket = ۳.۳× میانگین ماهانه. **صریح‌ترین spike سال**، driven by نیاز کاربر به محتوای داخلی پس از 9 اسفند.

**Ads**: فقط KikoMax تابستان ۴۵M Toman — جریان درآمد بکر است.

### Plan 32 — High-Value Tier (نه whale)

DB amount ۱۰,۰۰۰,۰۰۰ ریال = **۱ میلیون تومان per تراکنش** (نه ۱۰M Toman).

- ۲۰ تراکنش / ۱۳ کاربر منحصر = ~۲۰M تومان gross
- ARPPU = ~1.5M Toman = ~۲۰× ARPPU normal (77.5K Toman)
- محصولات رسمی Cafebazaar این پلن رو لیست نمی‌کنه → custom/internal flow
- هنوز high-value segment، ولی نه «whale $200» که قبلاً گفته بودم

**Action**: تأیید Backend که این پلن چیست (سالانه گسترش‌یافته؟ corporate? bundle?). در UI default بشه اگه legitimate است.

### Checkout Funnel

| فصل | DRAFT | Paid | Completion |
|------|-------|------|------------|
| Q2 | 7,413 | 332 | 4.28٪ |
| Q3 | 5,719 | 373 | 5.73٪ |
| Q4 | 13,167 | 1,082 | **6.78٪** |

روند مثبت ولی هنوز پایین (industry target: ۲۵-۳۰٪). فرصت بزرگ رشد بدون نیاز به acquisition.

---

## ۴. محتوا (Content)

### Production Stats

| Metric | Value | تفسیر |
|---------|-------|--------|
| محتوای جدید سال ۱۴۰۴ | 580 عنوان | ~۱۴۵ per quarter، یکنواخت پخش شد |
| محتوای دوبله خریداری | 40 عنوان (۶.۹٪) | engine اصلی engagement |
| ویدیو بارگزاری | 4,188 | avg ۷.۲ ویدیو/عنوان (سریال‌ها) |
| **سرمایه‌گذاری دوبله** | **502,350,000 تومان** (~502M) | avg ~۱۲.۵M Toman/عنوان |

### Content Mix Shift — کشف کلیدی

تحلیل category در ۶۰ عنوان top (Q2-Q4):

| دسته | Q2 | Q3 | Q4 | روند |
|------|-----|-----|-----|------|
| **K-Drama / آسیایی** | 5 | 8 | 11 | ⬆️ +۲.۲× — segment غالب جدید |
| **انیمیشن کودک (دوبله)** | 11 | 10 | 5 | ⬇️ افت |
| **اکشن/سوپرهیرو** | 2 | 1 | 4 | متغیر |
| **UGC (آس‌مون)** | 1 | 0 | 0 | از top خارج |
| **محتوای ایرانی** | ۰ | ۰ | ۰ | 🚨🚨 gap کامل |

**نتیجه‌گیری استراتژیک:** پلتفرم در حال شیفت از "platform کودک" به "platform K-Drama + کودک" است. این شیفت **همچنان ادامه دارد** (تأیید کاربر) → content strategy ۱۴۰۵ باید این رو reflect کنه.

### Top Hits per Quarter

**Q2 (تابستان):**

| عنوان | hours | viewers | منشأ |
|--------|-------|---------|-------|
| جواهر بخش ای | 4,022 | 1,014 | K-Drama |
| بچه‌های بد ۲ | 3,503 | 3,321 | دوبله (5B fund) ⭐ |
| ونزدی فصل دوم | 3,426 | 2,432 | دوبله (5B fund) ⭐ |
| ونزدی فصل دوم بخش دوم | 2,554 | 1,490 | دوبله (5B fund) ⭐ |
| آس‌مون (UGC) | 2,141 | 4,134 | UGC |
| زیبای حقیقی | 2,070 | 602 | K-Drama |
| نژا ۲ | 1,936 | 1,417 | دوبله (5B fund) ⭐ |

**Q3 (پاییز):**

| عنوان | hours | viewers | منشأ |
|--------|-------|---------|-------|
| زوتوپیا ۲ | 3,376 | 3,210 | دوبله (5B fund) ⭐ |
| نوش جان، اعلیحضرت | 1,474 | 531 | K-Drama |
| جواهر بخش ای | 1,179 | 346 | K-Drama |
| ونزدی فصل دوم بخش دوم | 1,155 | 800 | دوبله ⭐ |
| دیانا در لگو لند | 1,025 | 1,009 | دوبله (5B fund) ⭐ |

**Q4 (زمستان):**

| عنوان | hours | viewers | منشأ |
|--------|-------|---------|-------|
| جواهر بخش ای فصل دوم | 3,691 | 1,372 | K-Drama (sequel hit) ⭐ |
| زیبای حقیقی | 3,179 | 1,003 | K-Drama (+185٪ Q3→Q4) ⭐⭐ |
| زوتوپیا ۲ | 1,854 | 2,316 | دوبله ⭐ |
| بازی عشق در افسانه‌های شرقی | 1,539 | 434 | K-Drama |
| نینجا شطرنجی ۳ | 1,450 | 1,688 | دوبله (5B fund) ⭐ |
| بز (Goat) | 1,363 | 1,421 | دوبله (animation) ⭐ |

### ROI سرمایه‌گذاری دوبله (~502M Toman)

از ۴۰ عنوان دوبله، **حداقل ۱۰ عنوان در top 20 سه فصل ظاهر شدن**. عنوان‌های ردیابی‌شده watch hours:

| عنوان | کل ساعت Q2-Q4 |
|--------|------------------|
| Wednesday franchise (فصل ۲ + بخش دوم) | ~8,400 |
| Zootopia 2 | ~5,230 |
| Bad Guys 2 (بچه‌های بد ۲) | ~4,050 |
| Nezha 2 | 1,936 |
| Ninja Turtles 3 | 1,450 |
| بز | 1,363 |
| Diana in Legoland | 1,025 |
| Minecraft Movie | 681 |
| Pets on Train | 580 |
| Smurfs | 352 |
| **مجموع تایید‌شده در top** | **~25,000 ساعت** |

**Cost-per-Hour محاسبه:**
- 502M Toman / ۲۵,۰۰۰ ساعت = **~۲۰K Toman/ساعت در top content**
- اگه با شامل long-tail (احتمالاً ۴۰-۵۰K ساعت کل dubbed) → **~۱۰-۱۲K Toman/ساعت**
- avg per-title = **۱۲.۵M Toman per عنوان** (~$250 USD) — بسیار ارزان

**ROI Reality Check (با NET واقعی):**
- 502M Toman content cost vs **155M Toman** in-app NET revenue (کل سال ۱۴۰۴)
- **content cost = ۳۲۴٪ از in-app revenue** — content ~۳.۲× بزرگ‌تر از in-app
- pay-back در in-app **وجود ندارد**. ISP+Rubika اجباراً content رو subsidize می‌کنن.
- per-title هزینه ۱۲.۵M Toman (~$250 USD) برای licensed Wednesday/Zootopia → احتمالاً فقط هزینه دوبله، نه licensing
- ⚠️ **Implication**: اگر ISP یا Rubika افت کنن، content budget باید پاره بشه (و engagement خواهد افتاد)

### Franchise ROI Confirmation

**جواهر بخش ای فصل دوم vs اول:**
- Q4 (فصل ۲): 3,691h
- Q2 (فصل ۱): 4,022h
- ثبات بالا — sequel performance خوب

**زیبای حقیقی Q3 → Q4: +۱۸۵٪**  
نشانگر **long-tail discovery** — کاربر در Q3 دیدش، در Q4 word-of-mouth منجر به spike شد.

**Implication:** سرمایه‌گذاری روی **چند franchise مولد** بهتر از پراکندگی روی ۴۰ عنوان مستقل.

### مسائل ساختاری Content

**۱. Iranian Content Gap — کامل.** از ۶۰ top عنوان سال، **صفر محتوای ایرانی**. dependency ۱۰۰٪ به محتوای دوبله/خارجی → **ریسک قانونی/فرهنگی/strategic positioning بزرگ**. این برای platform ایرانی paradox بنیادی است.

**۲. UGC Long-tail Trap.** ۲۲K+ viewer در آس‌مون، ولی هیچ عنوان واحدی به top 20 نمی‌رسه (به جز Q2). یعنی monetization per-content غیرممکن — راه‌حل: per-creator revenue share.

**۳. Cost / Revenue Mismatch.** ۵۰۲M Toman هزینه دوبله، ۱۵۵M Toman درآمد in-app (نسبت ۳.۲×). dependency کامل به ISP + Rubika برای پوشش هزینه content. اگر این دو افت کنند، content budget اجباراً پاره می‌شه.

### Open Questions

- [ ] هزینه per-عنوان مشخص → ROI per-title precise
- [ ] محتوای اختصاصی سال ۱۴۰۴ — تعریف و تعداد؟
- [ ] برنامه تولید original داخلی برای ۱۴۰۵؟

---

## ۵. فیچرها و توسعه محصول (Product & Features)

### Headline

**۱۴۰۴ سال product-light بود.** سه release اپ در دوازده ماه؛ هیچ‌کدوم در حوزه گیمیفیکیشن core جدید نبود. این یک تصمیم استراتژیک بوده: تمرکز روی بهره‌برداری بیشتر از سیستم گیمیفیکیشن موجود (که قبل از ۱۴۰۴ build شده)، نه launch capability جدید.

**Implication:** رشد Q4 user و revenue **هیچ مدرکی ندارد که product-driven باشد**. در کنار external drivers (war/uprising)، شواهد product side هم انعکاس feature‌محور نیست.

### Releases سال ۱۴۰۴ — Cadence

| فصل | Release | تاریخ شمسی | gap از قبلی | یادداشت |
|------|---------|--------------|--------------|-----------|
| Q1 بهار | **5.2.0** | ۱۴۰۴/۰۳/۰۷ | — | Cinema launch |
| Q2 تابستان | **5.3.0** | ۱۴۰۴/۰۵/۲۱ | ~۲.۵ ماه | Asemon revamp + Profile |
| Q3 پاییز | **—** | — | **هیچ release** | تمرکز روی deepening، نه launching |
| Q4 زمستان | **5.3.1** | ۱۴۰۴/۱۱/۰۸ | ~۵.۵ ماه | Engagement layer |
| پس از ۸ بهمن | **—** | — | freeze | محدودیت‌های external (دوره war) |

Industry typical: ۸-۱۲ release/سال. DDM در ۱۴۰۴ یک‌چهارم این عدد بود.

### Q1 — Cinema (5.2.0، ۷ خرداد ۱۴۰۴)

| Aspect | جزئیات |
|---------|----------|
| **هدف** | ایجاد لایه co-watching اجتماعی (تماشای همزمان + چت زنده) |
| **حوزه** | محصول جدید — نه بسط محصول موجود |
| **داده استفاده** | Q2 = ۲۰۹ user → Q3 = ۲۵۸ → Q4 = **۶۲۶ (+۲۰۰٪)** |
| **ارزیابی** | rate رشد سالم، base بسیار کوچک نسبت به VOD (27K) / UGC (29K) |
| **ابهامات** | positioning unclear: مکمل VOD است؟ replacement TV live است؟ standalone استراتژیک است؟ |
| **سؤال CEO** | هزینه infrastructure هر session vs. revenue/user این segment؟ |

### Q2 — Asemon Revamp + Profile (5.3.0، ۲۱ مرداد ۱۴۰۴)

| Aspect | جزئیات |
|---------|----------|
| **هدف** | مدرنیزه UGC + شخصی‌سازی |
| **حوزه** | redesign محصول موجود |
| **زیر-فیچرها** | (۱) آسمون core (cleaner/faster) (۲) Personal Explore (algorithm) (۳) Friends Video (vertical feed) (۴) Profile redesign |
| **داده استفاده** | UGC users: Q2 22.3K → Q3 16.6K (افت همراه با کل MAU) → Q4 29.4K (recovery + بیشتر از Q2) |
| **مشکل attribution** | Q4 recovery همراه با war/uprising. **نمی‌توان گفت redesign کار کرد یا بی‌اثر بود** بدون cohort analysis (pre/post launch به تفکیک کاربر) |
| **سؤال CEO** | redesign به‌تنهایی چه impact داشت؟ بدون A/B test جواب قطعی نداریم |

### Q3 پاییز — هیچ Release اپ

سه ماه بدون deploy جدید. تیم فنی **capacity constrained** بود — تمرکز روی consolidation و سرویس‌های existing.

**نکته:** Q3 همزمان با افت MAU −۲۸٪ بود. این correlation است نه causation؛ افت Q3 بیشتر مربوط به اتمام تابستان (تعطیلات → مدرسه/دانشگاه) است.

### Q4 — Engagement Layer (5.3.1، ۸ بهمن ۱۴۰۴)

| Aspect | جزئیات |
|---------|----------|
| **هدف** | افزایش return rate، notification awareness، شخصی‌سازی profile |
| **حوزه** | engagement augmentation روی محصولات موجود |
| **زیر-فیچرها** | (۱) ربات DDM (event notifier — "وقتی نبودی چی شد") (۲) Avatar gallery (انتخاب از کتابخانه) (۳) Followers/Following visibility در آسمون (۴) Notification badges در رویدادها |
| **داده استفاده** | Stickiness Jan 12.3٪ → Feb 17.3٪ (+۵pp) → Mar 21.9٪ (+۹.۶pp از Jan) |
| **مشکل attribution بزرگ** | launch ۸ بهمن. شروع جنگ ۹ اسفند. **بهبود Feb stickiness ترکیب احتمالی feature + اواخر بهمن external bump است. Mar stickiness کاملاً driven by war / اینترنت ملی است.** نمی‌توان clean attribution داد. |
| **سؤال CEO** | اگر این فیچرها دوباره خاموش شوند، چقدر از stickiness می‌ماند؟ بدون feature flag، جواب ندارد. |

### پس از ۸ بهمن — Freeze

۸ بهمن تا ۲۹ اسفند (~۵۰ روز): هیچ deploy. علت: شروع جنگ ۹ اسفند → اولویت stability زیرساخت بر launch جدید.

### Strategic Stance ۱۴۰۴ (Position)

- سیستم گیمیفیکیشن DDM (Score, League, Spinner, Battle Pass, Daily Missions, Medals, Coin Transfer, Referral, Golden Path, User Leveling) **همگی قبل از ۱۴۰۴ build شده‌اند**.
- ۱۴۰۴ سال **maintenance** بود — نه expansion، نه deepening.

### Strategic Position ۱۴۰۵ (واقعیت‌محور)

**Theme:** **Maintenance Year** — به‌علت محدودیت ظرفیت تیم فنی (بخش ۷)، optimization و توسعه product در ۱۴۰۵ متوقف است.

**اولویت‌های ۱۴۰۵:**

| اولویت | کار | دلیل |
|--------|-----|------|
| ۱ | **Service continuity** — نگهداری زیرساخت، debug، uptime | تنها قابل اجرا با ظرفیت فعلی |
| ۲ | **B2B contract continuity** (ISP + Rubika ~۹۹٪ revenue) | survival vector اصلی |
| ۳ | **Team stabilization** (بخش ۷) | precondition هر چیز دیگری |
| ۴ | **Non-tech levers** — content، partnership، monetization tweaks که نیاز به code change ندارند | قابل اجرا بدون توسعه |

**Deferred to post-restoration:**
- Product optimization (Sweat the existing assets)
- A/B testing + Attribution infrastructure
- ۲۸ test backlog گیمیفیکیشن
- Cinema scale-up
- هر feature launch جدید

⚠️ این تصمیم باید در بخش ۱۰ (Q1 ۱۴۰۵ plan) به‌صورت شفاف به CEO ارائه شود. expectation board درباره product velocity ۱۴۰۵ باید reset شود.

### Risks مرتبط با بخش ۵

**۱. Product velocity ۱۴۰۵ = صفر**

با تیم در حالت maintenance، هیچ feature، optimization، یا A/B test ۱۴۰۵ ممکن نیست. این یعنی **یک سال دیگر بدون data-backed decision** ادامه خواهد یافت. در پایان ۱۴۰۵، به همین گزارش با همین سؤال‌ها باز خواهیم گشت.

**۲. هیچ attribution capability وجود ندارد و در ۱۴۰۵ هم اضافه نمی‌شود**

نه feature flag، نه A/B test، نه cohort tagging. هر impact ادعایی، correlation است نه causation. این gap تا restoration تیم باز می‌ماند.

**۳. Cinema decision frozen**

Cinema رشد +۲۰۰٪ نشان داد ولی scale-up نیاز به feature work دارد که در دسترس نیست. تصمیم از product به business development (مارکتینگ، partnership) منتقل می‌شود یا frozen می‌ماند.

**۴. ریسک perception external**

اگر ۱۴۰۵ هم بدون launch باشد، DDM در نظر بازار/talent در حالت stagnation دیده می‌شود. messaging external (به مارکت، به سرمایه‌گذار، به استخدام) باید با دقت طراحی شود تا maintenance mode به‌عنوان decline ظاهر نشود.

### Open Questions برای سشن‌های آینده

- [ ] Non-tech levers ۱۴۰۵ — کدام lever‌ها بدون code change قابل اجرا هستند (content، partnership، pricing، marketing)؟
- [ ] Restoration plan — تیم چه زمان و با چه scope بازسازی می‌شود؟
- [ ] External messaging — چطور maintenance year را به بازار/سرمایه‌گذار بگوییم بدون signal decline؟
- [ ] Post-restoration roadmap — همه deferred items (attribution، optimization، Cinema، گیمیفیکیشن) چه ترتیبی؟

---

## ۷. وضعیت تیم (Team Status)

### Headline

تیم DDM در پایان ۱۴۰۴ به ساختار کوچک‌تر منتقل شد. تیم فعلی **در حالت maintenance قرار دارد**؛ توسعه فعال متوقف است. تثبیت تیم باقی‌مانده و بازسازی ظرفیت، **precondition** هر گام استراتژیک ۱۴۰۵ است.

### ساختار فعلی (پایان ۱۴۰۴)

| نقش | تعداد | وضعیت |
|------|--------|---------|
| Product Manager | ۱ | فعال |
| Tech Lead | ۱ | maintenance |
| Backend Developer | ۱ | maintenance + debug |
| Android Developer | ۱ | maintenance + debug |
| **مجموع توسعه** | **۴** | non-development mode |

\* تیم‌های اجرایی (محتوا، مارکتینگ، …) خارج از این جدول.

### تغییرات سال ۱۴۰۴

**تعدیل Q4 (به دلیل شرایط جنگ + اقتصادی کشور): −۵ نفر**

| نقش حذف‌شده | تعداد |
|------|--------|
| Frontend Developer | ۱ |
| UI/UX Designer | ۲ |
| Associate PM (APM) | ۱ |
| Backend Developer | ۱ |
| **مجموع تعدیل** | **۵** |

### وضعیت فعلی — نکات بحرانی

**۱. توقف توسعه**

تیم فنی **هیچ توسعه‌ای انجام نمی‌دهد**. فعالیت محدود به:
- نگهداری سرویس‌ها
- رفع باگ‌های critical
- پاسخ به incidents

Implication: ۱۴۰۵ فاقد product velocity است. هر استراتژی نیازمند feature work (شامل optimization، A/B test، Cinema scale-up) **deferred** است تا restoration.

**۲. Compensation / Insurance Stability**

عدم پرداخت منظم حقوق و بیمه در دوره اخیر گزارش شده. این **بالاترین retention risk** سال است. در شرایط بازار فعلی تهران (تورم + رقابت talent)، gap compensation سریعاً به ترک منجر می‌شود.

**۳. Composition Gap**

ساختار فعلی بدون نقش‌های critical:
- بدون Frontend Dev → هیچ تغییر UI ممکن نیست
- بدون Designer → هیچ redesign یا flow جدید
- بدون APM → کل بار PM روی یک نفر
- بدون iOS Dev → اپ iOS احتمالاً stagnant

### چالش‌های HR ۱۴۰۴ (شناسایی‌شده)

- **تغییر ساختار تیم** — ~۵۵٪ کاهش ظرفیت توسعه (تخمین: ۹ نفر → ۴ نفر)
- **عدم پرداخت منظم بیمه و حقوق** — ریسک بنیادی برای retention و موضوعات legal

### Implication برای استراتژی ۱۴۰۵

#### پیش‌نیازهای اجرای استراتژی‌های قبلی

| استراتژی پیشنهادی | نیاز ظرفیت | وضعیت فعلی | امکان اجرا ۱۴۰۵ |
|------------|-----------------|-----------------|------|
| Optimization گیمیفیکیشن | تیم توسعه فعال | maintenance only | ✗ deferred |
| Attribution Infra (GrowthBook) | DevOps + Backend + Mobile ۸-۱۰ هفته | محدود | ✗ deferred |
| ۲۸ تست backlog گیمیفیکیشن | Backend + Mobile + Designer | unavailable | ✗ deferred |
| Cinema scale-up | Backend feature work | unavailable | ✗ deferred |
| ISP/Rubika continuity | non-tech | OK | ✓ |
| Content + Marketing | non-tech | OK | ✓ |

#### پیش‌نیاز Restoration (Q1-Q2 ۱۴۰۵)

برای بازگشت به حالت قابل اجرا حتی به‌صورت حداقلی:

| نقش | priority | اثر بازگشت |
|------|---------|--------------|
| Frontend Developer | P0 | unlock هر UI work |
| UI/UX Designer | P0 | unlock هر redesign/flow جدید |
| Backend Developer (+1) | P1 | unlock feature flag + A/B |
| APM | P2 | کاهش بار PM |
| iOS Developer | P2 | iOS app refresh |

**حداقل bring-back برای execution استراتژی ۱۴۰۵:** ۳ نفر (Frontend + Designer + Backend extra).

### ریسک‌های HR — اولویت ۱۴۰۵

| ریسک | احتمال | اثر | اولویت |
|------|----------|--------|--------|
| ترک Tech Lead | بالا (compensation gap) | catastrophic — توقف سرویس | P0 |
| ترک Backend dev | بالا | catastrophic — توقف سرویس | P0 |
| ترک Android dev | متوسط | اپ Android stagnate | P1 |
| ناتوانی hire سریع | بالا | restoration slip → ۱۴۰۵ کل maintenance | P0 |
| Legal escalation معوقه‌ها | متوسط | reputation + قانونی | P1 |

### Open Questions

- [ ] Plan دقیق پرداخت معوقه حقوق + بیمه چیست؟
- [ ] Budget استخدام مجدد Q1-Q2 ۱۴۰۵ تأیید شده؟
- [ ] Replacement strategy اگر Tech Lead یا Backend ترک کنه چیست؟
- [ ] برنامه retention immediate (bonus، promise concrete) برای ۴ نفر فعلی؟
- [ ] external messaging strategy درباره team size + product velocity ۱۴۰۵؟

### توصیه استراتژیک به CEO

**اولویت یک قبل از هر بحث محصول:** پایداری پرداخت تیم باقی‌مانده + plan قطعی restoration ۱۴۰۵. بدون این، هیچ یک از استراتژی‌های دیگر گزارش (revenue scaling، content، attribution، گیمیفیکیشن، Cinema) اجرایی نیست. این limit در گزارش به CEO باید صریح ارائه شود.

---

## ۶، ۸-۱۰. سایر بخش‌ها

🟡 **در دست تهیه — سشن‌های آینده**

- ۶. Roadmap status — از سیستم تسک (skipped این سشن)
- ۸. Traffic per ISP — داده موجود (MCI / MTN tab)
- ۹. Risks — synthesis نهایی (نیازمند بازنگری با team context جدید)
- ۱۰. Q1 ۱۴۰۵ Plan — strategic (به‌علت team context، rewrite فاندامنتال)

---

## ⚠️ ریسک‌ها و چالش‌های شناسایی شده

**۱. Dependency بیرونی بحرانی**
ISP + Rubika = **۹۹.۳٪** درآمد. in-app فقط ۰.۷٪. اگه یکی از قراردادها لغو شود، شکست ساختاری. این مهم‌ترین ریسک ۱۴۰۵.

**۲. رشد Q4 سستی‌پذیر**
درایور بیرونی (war/uprising) → وقتی موج فروکش کند، انتظار bounce-back شدید. Q1 ۱۴۰۵ نباید روی Q4 baseline ساخته شود.

**۳. Retention ضعیف**
Stickiness ژانویه ۱۲.۳٪، hours/user Q4 −۱۴٪ → کاربر اومد ولی engaged نشد. acquisition بدون retention = بانک شکسته.

**۴. ISP Q2→Q4 افت ۸۷٪**
از ۷.۳B به (تخمین) ۲.۵B-۳B Toman/فصل. ضرورت root-cause: نرخ، حجم، یا قرارداد؟

**۵. Magazine + TV underperforming**
دو محصول candidate برای kill/redesign. portfolio cleanup ضروری.

**۶. داده Q1 ۱۴۰۴ موجود نیست**
ClickHouse از ۱۴ جولای ۲۰۲۵ شروع شده — ۳ ماه اول سال blind است.

**۷. Iranian content gap — کامل**
از ۶۰ عنوان top، **صفر محتوای ایرانی**. dependency ۱۰۰٪ به دوبله/خارجی. ریسک fully dependent on foreign content licensing + ریسک regulatory برای platform ایرانی.

**۸. Content production capability**
۴۰ عنوان دوبله = خرید‌محور. هیچ تولید original داخلی نیست. سرمایه‌گذاری در production capability داخلی برای positioning long-term ضروری.

---

## 📋 Open Items

| Item | Owner |
|------|-------|
| Invoice ISP بهمن + اسفند کی صادر می‌شه؟ | Finance |
| ISP Q2→Q3 افت — تحلیل reason | تو + Finance |
| Plan 32 same-day double-buys — UX bug check | Backend |
| CMS export برای بخش ۴ | تو |
| Release notes per quarter برای بخش ۵ | تو |
| Team changes برای بخش ۷ | HR |
| Roadmap status برای بخش ۶ | تو |
| Trial activation Feb regression — root cause | Product/Eng |

---

## Methodology Notes

- **Active User**: کاربر ثبت‌شده با ≥۱ watch session دارای ≥۶۰ ثانیه در ۳۰ روز
- **Anonymous**: حذف (~۳۵٪ traffic — under-report اپتیمیستی شناسایی‌شده‌ها)
- **Comparison**: QoQ درون ۱۴۰۴
- **Revenue currency**: تومان (تبدیل از ریال ÷ ۱۰)
- **DB amount column**: ریال (databases-reference نادرست بود — اصلاح‌شده)
- **Quarter boundaries**: فصل شمسی (Q2 = ۱ تیر تا ۳۱ شهریور)
- **In-App authoritative source**: گزارش رسمی Cafebazaar xlsx + Myket CSV (نه DB amount)
- **Plan 32**: ۱M Toman per txn (نه ۱۰M که از DB غلط تفسیر شد)
- **type=3 plans + Zarinpal**: حذف از in-app analysis (admin/test entries)
