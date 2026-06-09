# Reality Check — Revenue Plan ۱۴۰۵ (CEO Proposal)

**فایل منبع:** `Didimon_Revenue_Plan_1405.pptx`
**تاریخ بررسی:** ۲ ژوئن ۲۰۲۶ (۱۲ خرداد ۱۴۰۵)
**Author:** PM (تو) — برای ارائه به CEO

---

## ⚡ خلاصه مدیریتی

پلن CEO **سه مسئله بنیادی** دارد:

1. **اعداد baseline در slide ۲ با reality گزارش ۱۴۰۴ بین ۲× تا ۷× اغراق شده.** ساختن سناریو روی baseline اشتباه = هدف غلط.
2. **۴ از ۶ stream نیازمند tech development است** — در شرایط تیم maintenance، اجرا نمی‌شود.
3. **۲ stream که قابل اجرا است (ISP + B2B) همان چیزی است که در حال حاضر ~۹۹٪ revenue ما را تأمین می‌کند.** پلن عملاً = "همان کار، بزرگ‌تر".

⚠️ **توصیه:** پلن نیاز به بازنگری دارد قبل از commit به board. اولویت: تصحیح baseline، تفکیک stream‌های قابل اجرا از منوط به restoration، تنظیم سناریوهای رشد با واقعیت ظرفیت.

---

## ۱. Slide-by-Slide Reality Check

### Slide 2 — وضعیت فعلی

| ادعا | داده گزارش فصلی ۱۴۰۴ | gap | منبع |
|---------|--------------|------|-----|
| **۱.۲M نصب** | ~۱۶.۳K Cafebazaar Q4 + Myket محدود ≈ ۸۰-۱۲۰K/سال | منطقی فقط اگر cumulative از زمان launch (~۳-۴ سال؟) | بخش ۲ گزارش |
| **۸۰K MAU** | Q4 unique MAU = **۳۳K** (سال peak) | **۲.۴× اغراق** | بخش ۲ گزارش |
| **۲۵K DAU** | Mar 2026 (best ماه) = **۳.۸K** avg DAU | **۶.۶× اغراق** | بخش ۲ گزارش |
| **۲۵M دقیقه واچ‌تایم/ماه** | Aug 2025 (best ماه) = ۸۶,۴۷۵ ساعت = **۵.۲M دقیقه** | **۴.۸-۶.۸× اغراق** | بخش ۲ گزارش |

**مشکوک:** ممکن است CEO از منبع دیگری استفاده کرده باشد:
- شامل anonymous users (که در definition ما حذف شده — ۳۵٪ traffic)
- شامل registered ولی بدون watch ≥60s
- شامل other platforms (Rubika view‌های external؟)
- یا اصلاً اعداد قدیمی (شاید قبل از instrumentation cleanup)

**اقدام لازم:** قبل از هر تحلیل سناریو، CEO باید **منبع اعداد** را تأیید کند. بدون این، سناریوها روی شن بنا شده‌اند.

### Slide 3 — چالش مدل فعلی

CEO ادعا: "وابستگی به ترافیک، نیاز به افزایش درآمد مستقیم و مقیاس‌پذیر"

**ارزیابی:** ✓ **این تشخیص درست است.** گزارش ۱۴۰۴ هم نشان داد ~۹۹٪ revenue از ISP + Rubika (B2B) است و in-app فقط ۰.۴٪.

ولی... CEO به اشتباه فرض می‌کند "افزایش درآمد مستقیم = ساخت stream‌های جدید". واقعیت: با تیم فعلی، **افزایش از stream‌های موجود (ISP + Rubika) مسیر سریع‌تر و قابل اجرا است**.

### Slide 4 — معماری ۶-stream

| Stream | وضعیت | Tech needed | Implementation Q1-Q2 ۱۴۰۵ |
|---------|-----------|------------------|----|
| فروش ترافیک (ISP) | ~۱۵.۵B Toman/سال | ✗ | ✓ Sales/BD |
| اشتراک پلاس | ۱۵۵M Toman/سال | ⚠️ partial | ⚠️ فقط pricing/plan tweak از admin |
| دی‌کوین | adoption unknown | ✓ heavy | ✗ deferred |
| تبلیغات | ~۰ Toman فعلی | ✓ medium | ⚠️ ad sales تنها بدون integration |
| آسمون B2C | ~۰ Toman فعلی | ✓ heavy | ✗ deferred |
| B2B services | ~۷.۳B Toman (Rubika) | ✗ | ✓ Sales/BD |

**فقط ۲ از ۶ stream با تیم فعلی قابل scale است.** ۴ تای دیگر deferred تا restoration.

### Slide 5 — اشتراک پلاس

ادعا: "بسته‌های متنوع، مزایای VIP، محتوای اختصاصی"

**ارزیابی:**
- **بسته‌های متنوع:** ✓ pricing/plan tweak ممکن است از admin panel (نه code)
- **مزایای VIP:** ✗ feature work نیاز دارد (badge، priority، exclusive section) — deferred
- **محتوای اختصاصی:** ✓ content team موجود، قابل اجرا

**Plan 32 پیشین:** ما در ۱۴۰۴ Plan 32 (۱M Toman per txn، ۱۳ user، ARPPU ۲۰×) را custom kept. این **case study مهم** است. می‌توان adoption Plan 32 را برای ۱۴۰۵ scale کرد (در صورت visible کردن یا BD outreach) — این lever بدون feature جدید.

### Slide 6 — اقتصاد دی‌کوین

ادعا: "فروش بسته، باندل اشتراک + دی‌کوین، افزایش تراکنش"

**ارزیابی:**
- **adoption موجود دی‌کوین unknown** — هیچ baseline نداریم
- در سشن‌های قبل گفتیم: "گیمیفیکیشن هنوز کامل زیر بار نرفته" — hypothesis، نه fact
- تا adoption metric دقیق نباشد، scale بدون evidence یعنی guesswork
- **بسته‌های جدید** نیاز به product work دارد (نمایش، pricing، payment flow) — deferred
- **باندل** ممکن است از admin (pricing) ولی marketing نیاز به landing/asset — design needed

### Slide 7 — تبلیغات نوجوان

ادعا: "اسپانسرینگ، تبلیغات ویدیویی، کمپین برند"

**ارزیابی:**
- KikoMax تابستان ۱۴۰۴ = ۴۵M Toman، الان صفر
- علت stop؟ — باید بفهمیم
- اسپانسرینگ + کمپین برند **بدون tech قابل اجرا** اگر ad sales person/team باشد
- **تبلیغات ویدیویی** نیاز به integration (pre-roll، mid-roll، tracking) — deferred
- این stream نیازمند **ad sales person** که الان نداریم — capacity gap جدید

### Slide 8 — تجاری‌سازی آسمون

ادعا: "Paid Promotion، ranking تولیدکنندگان، کمپین UGC"

**ارزیابی:**
- آسمون active است (۲۹K user Q4) ولی monetization صفر
- **Paid promotion** نیاز به product work (creator dashboard، payment، analytics) — deferred
- **Ranking** = leaderboard feature — deferred
- **کمپین‌های UGC** = manual، ممکن است غیر-tech (community management + reward از admin)
- ⚠️ یادمان نرود: UGC long-tail trap (۲۲K viewer، هیچ عنوان به top 20 نرسید) — monetization per-creator باید با دقت طراحی شود

### Slide 9 — B2B services

ادعا: "تامین محتوا، مدیریت سرویس کودک/نوجوان، کمپین اختصاصی"

**ارزیابی:** ✓ **این بهترین stream برای ۱۴۰۵.**
- Rubika قبلاً ~۷.۳B Toman generate کرد (۱۴۰۴)
- اسفند ۱۴۰۴ peak = ۲.۰۶B Toman تک‌ماه
- B2B = sales + content، **بدون tech**
- اگر اپراتورها دیگر (همراه اول، رایتل) یا سکوهای دیگر (تلوبیون، فیلیمو) را بتوانیم target کنیم، scale ممکن است
- **این مسیر اولویت ۱ ۱۴۰۵ باید باشد**

### Slide 10 — سناریوهای رشد

| سناریو | ضریب | اگر روی baseline درست | اگر روی baseline اغراق‌شده |
|--------|------|--------------------|------------------------------|
| محافظه‌کارانه | ۱.۵× | ۲۲.۹B → ۳۴.۴B Toman | احتمالاً impossible |
| محتمل | ۳× | ۲۲.۹B → ۶۸.۹B Toman | impossible با تیم فعلی |
| تهاجمی | ۵× | ۲۲.۹B → ۱۱۴.۸B Toman | impossible |

**realistic سقف ۱۴۰۵ با ۴ نفر maintenance و non-tech levers:**
- ISP scale: maybe +۱۵-۳۰٪ (نگوشیتیشن، expansion contracts)
- Rubika scale: maybe +۳۰-۵۰٪ (در صورت ادامه external traffic spike)
- in-app: stagnant یا +۱۰-۲۰٪ (از Plan 32 manual scale + pricing tweak)
- ads: maybe +۵۰M Toman/سال (KikoMax restart) — جزئی

**Realistic total range: ۲۸-۳۲B Toman (+۲۰-۴۰٪)**.

این بین "محافظه‌کارانه" و "محتمل" بسته به restoration timing است. **"تهاجمی ۵×" در سال ۱۴۰۵ غیرقابل دسترس است** بدون restoration کامل + investment marketing عظیم.

---

## ۲. مهم‌ترین Gap که باید با CEO صحبت شه

### A. Baseline اشتباه

اعداد slide ۲ احتمالاً از:
- منبع متفاوت با ClickHouse گزارش
- دوره مختلف (peak تک‌ماه vs avg)
- definition متفاوت (شامل anonymous)
- یا simply استرس‌سازی برای board

**باید:** قبل از هر تحلیل، CEO تأیید کند اعداد از کدام منبع است. اگر منبع متفاوت داریم، باید بدانیم چه چیزی track می‌شود.

### B. Capacity نادیده گرفته شده

پلن فرض می‌کند تیم برای ۴ stream جدید کار خواهد کرد. واقعیت: تیم فنی maintenance only، با عدم پرداخت حقوق منظم.

**باید:** بخش ۷ گزارش (Team Status) ضمیمه پلن شود. CEO باید بداند ۴ از ۶ stream **منوط به restoration** است.

### C. سناریوهای رشد فاقد lever بازکن

پلن می‌گوید "محتمل ۳×" ولی نمی‌گوید **چگونه**. هیچ specific:
- چه scale ISP؟ kdam قرارداد؟
- چه marketing budget برای acquisition؟
- چه content investment برای engagement؟
- چه nigotiation B2B دیگر؟

**باید:** هر سناریو با concrete lever-map همراه باشد. بدون این، سناریو wishful thinking است.

### D. تناقض با وضعیت تیم

پلن از CEO آمده، ولی همان CEO (یا his team) تصمیم تعدیل ۵ نفر در Q4 گرفت. این dissonance باید resolve شود:
- "تعدیل به دلیل شرایط جنگ + اقتصادی" → expectation rest = restoration هم تأخیر دارد
- ولی plan ۱۴۰۵ ۳× یا ۵× رشد فرض گرفته
- **این دو با هم سازگار نیست**

---

## ۳. توصیه به CEO (پیشنهاد)

### ۳.۱ تصحیح baseline

از CEO بپرس:
- اعداد slide ۲ از کدام منبع است؟
- آیا اعداد فعلی شامل anonymous + non-engaged user است؟
- آیا cumulative است یا monthly?

سپس **baseline اصلاح‌شده** را ست کن:
- MAU: ۲۵-۳۳K (بسته به فصل)
- DAU: ۲-۴K
- Watch-time monthly: ۴-۵M دقیقه
- در صورت بازنگری definition، rewrite slide ۲ با clear methodology

### ۳.۲ اولویت‌بندی stream‌ها

اولویت ۱ (Q1-Q2 ۱۴۰۵، بدون tech):
- ISP partnership expansion
- B2B services scale (Rubika + اپراتور دیگر + سکوهای دیگر)

اولویت ۲ (Q1-Q2، با tweak محدود):
- Subscription pricing/plan tweak از admin
- Ad sales restart (KikoMax + dialogue با ad sales person)
- Content investment روی محتوای موجود (K-Drama، dubbed)

اولویت ۳ (deferred تا restoration):
- دی‌کوین scale
- Subscription VIP features
- Ad video integration
- آسمون monetization
- Paid promotion creators

### ۳.۳ سناریوها با lever

پیشنهاد به CEO:
| سناریو | تعریف | شرط تحقق |
|--------|-----------|-----------|
| محافظه‌کارانه (+۲۰٪) | حفظ revenue با ISP + Rubika continuity | بدون team restoration |
| محتمل (+۴۰-۶۰٪) | ISP + Rubika scale + ad restart + pricing tweak | با ۳ نفر restoration در Q2 |
| تهاجمی (+۱۰۰-۱۵۰٪) | همه stream + سکوی جدید B2B + product investment | با ۵-۷ نفر restoration در Q1 |

**ضریب ۳× و ۵× که در پلن آمده، در ۱۴۰۵ ممکن نیست بدون شرایط بنیادی تغییر.**

### ۳.۴ Decision Points

این تصمیمات باید قبل از commit به board گرفته شود:
- آیا restoration در Q1-Q2 قطعی است؟
- اگر restoration نیست، آیا تنزل expectation برای board آماده‌اید؟
- پلن compensation/insurance برای ۴ نفر فعلی چیست؟
- ad sales person استخدام می‌شود؟ یا outsource ad?
- سکوهای دیگر B2B (همراه اول، تلوبیون، فیلیمو) target می‌شوند؟

---

## ۴. خلاصه برای ارائه به CEO

> **پیام به CEO:** پلن stream‌بندی درست است و تشخیص "وابستگی به ترافیک" دقیق. ولی اعداد baseline در slide ۲ با گزارش فصلی ۱۴۰۴ ما بین ۲× تا ۷× تفاوت دارد، که نیاز به تصحیح دارد قبل از سناریوسازی.
>
> دوم، با تیم فعلی (maintenance mode، ۴ نفر) ۴ از ۶ stream اجرا نمی‌شود — این streams منوط به restoration هستند که خود نیازمند تصمیم compensation است. ۲ stream قابل اجرا (ISP + B2B) همان چیزی است که ~۹۹٪ revenue را تأمین می‌کند، پس scale آنها مسیر سریع‌ترین رشد است.
>
> سناریوهای ۳× و ۵× در سال ۱۴۰۵ بدون restoration بنیادی غیرقابل دسترس است. realistic range +۲۰ تا +۴۰٪ بسته به timing restoration و scale BD ISP/B2B.

---

## ۵. Open Items

- [ ] CEO باید منبع اعداد slide ۲ را تأیید کند
- [ ] Decision قطعی: restoration در Q1-Q2 ۱۴۰۵ یا maintenance year کامل
- [ ] BD مسیر ISP/B2B — چه قراردادهای جدیدی در دسترس است؟
- [ ] Ad sales person hire یا outsource
- [ ] هر stream نیازمند lever map specific (نه فقط headline)
