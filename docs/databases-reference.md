# DDM Databases - مرجع فشرده

> دو دیتابیس اصلی برای تحلیل KPI

## 1. Score DB (PostgreSQL)

**نوع**: میکروسرویس گیمیفیکیشن
**Schema**: `score` | **Owner**: `usr_score_service`
**تعداد جدول**: 27
**Timestamp**: تمام `created_at` ها `bigint` (Unix epoch)
**Join key**: `channel_did` (text) → معادل `user_id` در ClickHouse

### جداول اصلی (به ترتیب اهمیت)

| Table | حجم | محتوا |
|-------|-----|-------|
| `users` | 7 ردیف | ⚠️ فقط ادمین‌ها (نه کاربران واقعی) |
| `user_coin_history` | 473K | تاریخچه تغییرات سکه |
| `user_lotteries` | 780K | شرکت کاربران در قرعه‌کشی |
| `user_actions` | - | اکشن‌های امتیازآور (Watch, Invite, ...) |
| `user_levels` | - | سطح کاربری (1-100) |
| `user_medals` | - | مدال‌های کسب‌شده (8 نوع × 5 سطح) |
| `user_rewards` | - | جوایز دریافتی کاربر |
| `user_ids` | - | ID mapping کاربران |
| `user_suspends` | - | کاربران معلق |
| `season_scores` | - | امتیاز در فصل (Battle Pass) |
| `season_steps` | - | پله‌های Battle Pass |
| `seasons` | - | فصل‌ها (معمولاً 1 هفته) |
| `step_rewards` | - | جوایز هر پله |
| `levels` | - | تعریف سطوح |
| `medals` | - | تعریف مدال‌ها |
| `rewards` | - | تعریف جوایز |
| `lotteries` | - | قرعه‌کشی‌ها |
| `chests` | - | باکس‌ها (جایزه) |
| `coin_transactions` | - | تراکنش سکه |
| `convert_scores` | - | تبدیل امتیاز → سکه (100=1) |
| `detail_got_views` | - | ⚠️ **CREATOR**: ویدیوهای کاربر در UGC که بازدید خورده |
| `total_got_views` | - | ⚠️ **CREATOR**: مجموع واچ تایم ویدیوهای UGC کاربر |
| `detail_scores` | - | جزئیات کسب امتیاز |
| `settings` | - | تنظیمات کلی سیستم |
| `platforms` | - | پلتفرم‌ها |
| `import_rewards` | - | ورود گروهی جوایز |
| `expenses` | - | هزینه‌ها |

### نکات حیاتی

- `users` فقط ادمین‌ها — برای کاربر واقعی از `channel_did` در سایر جداول استفاده کن
- `detail_got_views` و `total_got_views` → آنالیتیکس کریتور (نه viewer)
- بخش‌های ناتمام: Admin reward, User Suspend, Update total coin

---

## 2. ClickHouse — stats.watch_events

**نوع**: انباره رویداد (event store) برای واچ ویدیو
**حجم**: 78,247,514 ردیف خام (10.5 ماه قابل استفاده)
**شروع دیتا**: 2025-07-14
**Unique users**: 78,544
**Anonymous ratio**: ~35% (ضعف instrumentation)

### Schema

| Column | Type | Notes |
|--------|------|-------|
| `created_at` | DateTime | timestamp رویداد |
| `app` | UInt8 | 1=android, 2=web, 3=rubika(pwa), 4=splus |
| `version` | LowCardinality(String) | نسخه اپ |
| `via` | UInt8 | 1=main(VOD), 2=vlog(magazine), 3=cinema, 4=streamer(TV), 5=vitrine(UGC) |
| `isp` | UInt8 | 1=mci, 2=irancell, 3=others |
| `user_id` | String | معادل `channel_did` در Score DB |
| `content_id` | String | شناسه محتوا |
| `content_title` | String | عنوان محتوا |
| `video_id` | String | شناسه ویدیو |
| `video_title` | String | عنوان ویدیو |
| `watch_duration` | UInt32 | **ثانیه** (نه میلی‌ثانیه) |

### Watch Duration Stats

- min=1s | max=129,600s (36h - outlier) | avg=42s | median=8s | p95=78s
- median=8s → رفتار scroll-and-skip غالب
- پیشنهاد فیلتر: `watch_duration BETWEEN 1 AND 14400` (تا 4 ساعت)
- "Active view" پیشنهادی: `>= 10s`

### Enum Reference

**via** (محصول):
```
1 = main      → VOD اصلی
2 = vlog      → مجله (ویدیو کوتاه)
3 = cinema    → سینما آنلاین
4 = streamer  → TV لایو 24h
5 = vitrine   → آس‌مون (UGC)
```

**app** (پلتفرم):
```
1 = android
2 = web
3 = rubika    → pwa.didimoon.com
4 = splus     → splus.didimoon.com
```

**isp** (اپراتور):
```
1 = mci
2 = irancell
3 = others
```

---

## 3. Identity Stitching

**کلید اتصال دو دیتابیس**:
```
ClickHouse.stats.watch_events.user_id  ←→  PostgreSQL.score.*.channel_did
```

هر دو text/string. مستقیم join.

### کاربردهای رایج

| تحلیل | منبع |
|-------|------|
| DAU/MAU/Watch Time | ClickHouse |
| Cohort Retention | ClickHouse (با first_seen) |
| Score/Coin/Level | Score DB |
| Battle Pass Progress | Score DB (season_scores) |
| Creator analytics | Score DB (detail_got_views, total_got_views) |
| Watch + Gamification combined | Join via `user_id = channel_did` |

---

## 4. Subscription DB (MySQL — Yii Framework)

**نام container**: `subscription-service-mysql-1`
**حجم اصلی**: tbl_user_payment=197K | tbl_voucher=112K | tbl_user=58K
**Timestamp**: تمام `created_at`، `expired_at` — int (Unix epoch ثانیه)
**Currency**: ⚠️ **ریال** (تأیید‌شده با کاربر 1 خرداد 1405). برای نمایش به تومان: `amount / 10`. قبلاً اشتباهاً «تومان» نوشته شده بود.

### جداول اصلی

| جدول | حجم | محتوا |
|------|-----|-------|
| `tbl_user_payment` | 197K | تراکنش‌های پرداخت |
| `tbl_voucher` | 112K | کد تخفیف / گیفت کارت |
| `tbl_user` | 58K | کاربران واقعی (نه ادمین!) |
| `tbl_price` | 107 | پلن‌ها / coin packs |
| `tbl_gateway` | 6 | درگاه‌های پرداخت |
| `tbl_platform` | 2 | پلتفرم‌ها (didimoon=1, NOT=2) |

### Identity Stitching

```
ClickHouse.user_id ↔ Score DB.channel_did ↔ tbl_user.details->>'channelDid'
```

```sql
-- استخراج channelDid:
JSON_UNQUOTE(JSON_EXTRACT(tbl_user.details, '$.channelDid'))
```

⚠️ **هشدار**: نه همه کاربران `channelDid` دارن — فقط آنها که channel ساخته‌اند (creator یا hybrid). برخی فقط `userId` دارن (pure viewer). نسبت coverage باید با کوئری دقیق شود.

### Enums (Status — کامل از کد)

**`tbl_user_payment.status`** — Status workflow:
| ID | Name | معنی |
|----|------|------|
| 11 | PENDING | شروع، در انتظار |
| **12** | **DRAFT** | ⚠️ پیش‌نویس — هرگز پرداخت نشده |
| 13 | PENDING_CONFIRM | منتظر تأیید |
| 21 | IN_PROGRESS | در حال پردازش |
| 31 | FAILED | شکست |
| 32 | FAILED_SEND_TO_QUEUE | شکست در صف |
| 40 | ACTIVE_INVISIBLE | فعال ولی hidden |
| **41** | **ACTIVE** | ✅ پرداخت موفق / voucher activate |
| 42 | PUBLISHED | منتشر شده |
| 43 | CONVERTED | تبدیل شده |
| 44 | ACCEPTED | پذیرفته شده |
| 51 | DISABLED | غیرفعال |
| 52 | DELETED | حذف شده |
| 53 | REJECTED | رد شده |
| 54 | EXPIRE | منقضی |

### قوانین فیلتر Revenue

```sql
-- Paid Revenue (پول واقعی)
WHERE platform_id = 1 AND status = 41 AND amount > 0

-- Voucher Activated (رایگان)
WHERE platform_id = 1 AND status = 41 AND amount = 0

-- Cart Abandonment numerator
WHERE platform_id = 1 AND status = 12

-- Test filter
AND (JSON_EXTRACT(details, '$.environment') IS NULL
     OR JSON_UNQUOTE(JSON_EXTRACT(details, '$.environment')) != 'test.sandbox')
```

**`tbl_user_payment.type`** — احتمالاً payment mode (همه type=1 در سنپشات)
**Product type** از `tbl_price.type` می‌آید: 1=subscription | 2=coin_pack

**`tbl_price.status`**: 41=ACTIVE | 51=DISABLED | 40=ACTIVE_INVISIBLE (Seasonal)
**`tbl_user.status`**: 41=ACTIVE (همه کاربران فعلاً 41)

### Platforms

- `platform_id=1` = didimoon → **همه KPI ها باید این فیلتر را داشته باشند**
- `platform_id=2` = NOT (NotClub.ir) — نه DDM

### Gateways (status=41 همه فعال)

| id | name | نوع | platform |
|----|------|-----|----------|
| 1 | pay | direct | 1 |
| 2 | cafebazaar | in-app billing | 1 |
| 3 | myket | in-app billing | 1 |
| 5 | didimoon | internal (sub via coin) | 1 |
| 6 | zarinpal | direct | 1 |
| 7 | top | direct | 2 (NOT) |

### Active Plans (Snapshot — May 2026)

**اشتراک (price.type=1, status=41)** — قیمت‌ها در تومان (DB ÷ ۱۰):
| ID | نام | تومان | duration |
|----|-----|-------|----------|
| 2 | 3 ماهه | 88.2K | 3 |
| 6 | 1 ساله | 352.8K | 12 |
| 19 | 1 ماهه | 98K | 1 |
| 20 | 6 ماهه | 176.4K | 6 |
| 21 | 1 ماهه 50% تخفیف | 17.5K | 1 (status=40) |
| 32 | high-value | 1,000K (1M) | special |

**Coin Packs (price.type=2, status=41)** — قیمت‌ها در تومان:
| ID | محتوا | تومان | تومان/سکه |
|----|-------|-------|-----------|
| 9 | 50 دی‌کوین | 10K | 200 |
| 11 | 250 دی‌کوین | 40K | 160 |
| 12 | 750 دی‌کوین | 99K | 132 |
| 13 | 500 دی‌کوین | 75K | 150 |

### Quick Insights (Snapshot May 2026 — تصحیح‌شده)

> ⚠️ قبلاً اشتباهاً status=12 رو موفق فرض کردیم. status=12 پیش‌نویس است. موفق = status=41.

**Revenue واقعی (status=41, amount>0)** — ⚠️ اعداد قبلی ۱۰× بزرگ‌نمایی داشت (DB در ریال است):
- ~705 تراکنش موفق/ماه
- ~21.4M تومان/ماه gross (نه 214M — تقسیم بر ۱۰)
- ARPPU gross ≈ 30K تومان/payer (نه 304K)
- ARPU gross ≈ 1.3K تومان/MAU
- **منبع authoritative برای NET**: گزارش رسمی Cafebazaar xlsx + Myket CSV (نه DB amount)

**Voucher (status=41, amount=0)**:
- ~392/ماه voucher activate شده
- بدون درآمد ولی conversion contribution دارد

**Cart Abandonment 🚨**:
- 9,906 DRAFT vs 940 ACTIVE paid (90 روز)
- **نرخ تکمیل پرداخت = 9.5%** (هدف >40%)
- **بزرگ‌ترین leak revenue** — این رو fix کنیم، revenue 4-5x میشه

**Conversion to Payer**:
- Paid: 4.3% | Total (با voucher): 6.8% | هنوز بالاتر از baseline قدیمی

**Product Mix**:
- Subscription سالانه = 3x ماهانه (تخفیف 75%) → push to annual

---

## 5. Baseline اولیه (May 2026)

از کوئری 30 روز اخیر:

| متریک | مقدار |
|-------|-------|
| DAU (شناسایی‌شده) | 2,500-2,800 |
| MAU (30d) | 16,193 |
| Stickiness (DAU/MAU) | ~16% |
| Avg watch min/user/day | ~49 دقیقه |
| Events/day | 160K-180K |
| Anonymous events/day | ~85K (35%) |

### Per via (30 روز)

| via | users | total hours | avg sec/event |
|-----|-------|-------------|---------------|
| 1 (VOD) | 11,206 | 43,184 | 889 |
| 5 (UGC) | 11,762 | 19,634 | 15.8 |
| 3 (Cinema) | 65 | 39.8 | 292 |
| 2 (Vlog) | 735 | 19.7 | 25.7 |

**نکته**: TV (via=4) در نمونه نبود — یا داده ندارد یا فیلتر شده.

VOD = طولانی + کمتر کاربر | UGC = کوتاه + بیشتر کاربر → دو محصول کاملاً متفاوت.
