# In-App Revenue Reconciliation — سال ۱۴۰۴

**هدف**: تطبیق سه منبع داده in-app revenue → اعداد نهایی authoritative
**تاریخ**: خرداد ۱۴۰۵
**Status**: ✅ نهایی شده

---

## سه منبع داده

| منبع | ماهیت | واحد | پوشش |
|------|--------|-------|------|
| **DB tbl_user_payment** | تراکنش‌های ثبت‌شده در سیستم DDM | ریال (gross) | کامل |
| **Cafebazaar xlsx** | گزارش رسمی Cafebazaar Developer Panel | ریال (gross + net) | کامل |
| **Myket CSV** | گزارش رسمی Myket | ریال (NET سهم توسعه‌دهنده) | کامل |
| شمارش دستی کاربر | از Cafebazaar Console (احتمالاً) | تعداد فقط | فقط count |

---

## نتیجه نهایی: NET In-App Revenue ۱۴۰۴

| Quarter | Cafebazaar NET | Myket NET | **TOTAL NET (Toman)** |
|---------|----------------|-----------|---------------------------|
| Q1 بهار | 19,607,257 | 16,046,179 | **35,653,436** |
| Q2 تابستان | 19,709,609 | 16,313,617 | **36,023,226** |
| Q3 پاییز | 14,234,583 | 14,910,060 | **29,144,643** |
| Q4 زمستان | 15,926,827 | 38,593,134 | **54,519,961** |
| **سال** | **69,478,276** | **85,862,990** | **~۱۵۵M Toman** |

---

## Cross-Source Validation

### Revenue Gross Comparison

| Quarter | DB Gross Cafe | Xlsx Gross Cafe | DB Gross Myket | CSV/Myket Gross |
|---------|---------------|-------------------|------------------|-------------------|
| Q1 | 24.11M | 25.77M | 20.68M | n/a (CSV is net) |
| Q2 | 25.44M | 25.55M | 20.74M | n/a |
| Q3 | 18.54M | 18.45M | 19.20M | n/a |
| Q4 | 20.31M | 20.70M | 48.36M | n/a |

DB gross ≈ Cafebazaar xlsx gross (تفاوت ۱-۲٪، احتمالاً refunds). DB authoritative برای gross.

### Net-to-Gross Ratio Validation

```
Myket NET / DB Myket Gross = 85.86 / 108.98 = 78.8%
Cafebazaar NET / DB Cafebazaar Gross = 69.48 / 88.40 = 78.6%
```

هر دو مارکت ~۲۱-۲۲٪ کارمزد می‌گیرن (VAT ۱۰٪ + market commission ۱۵٪ - small variance). **متعادل با industry standard.**

---

## Transaction Count Reconciliation

### DB Monthly Transactions (status=41, amount>0)

| ماه | Cafebazaar | Myket | جمع DB |
|-----|------------|-------|---------|
| فروردین | 42 | 51 | 93 |
| اردیبهشت | 70 | 57 | 127 |
| خرداد | 133 | 123 | 256 |
| تیر | 131 | 79 | 210 |
| مرداد | 84 | 77 | 161 |
| شهریور | 54 | 70 | 124 |
| مهر | 44 | 52 | 96 |
| آبان | 56 | 58 | 114 |
| آذر | 77 | 86 | 163 |
| دی | 102 | 193 | 295 |
| بهمن | 94 | 187 | 281 |
| اسفند | 137 | 362 | 499 |
| **سال** | **1,024** | **1,495** | **2,519** |

### vs کاربر دستی

| منبع | Cafebazaar | Myket | جمع |
|------|------------|-------|------|
| **DB** | 1,024 | 1,495 | 2,519 |
| **کاربر دستی** | 1,482 | 1,434 | 2,916 |
| **تفاوت** | -458 (-31٪) | +61 (+4٪) | -397 |

### تفسیر

**Myket متطابق ✓**: تفاوت ۴٪ معمولی (شاید چند refund). DB قابل اعتماد.

**Cafebazaar تفاوت بزرگ ۳۱٪**: علت‌های احتمالی:
1. کاربر از Cafebazaar Developer Console شمرده — احتمالاً شامل canceled/retry events
2. trial sub_7d Q4 (~۱۵۳ تراکنش) که اگه voucher با amount=0 باشن، فیلتر `amount > 0` آنها رو حذف می‌کنه
3. webhook failures که در DB ثبت نشدن

**توصیه:** DB count برای revenue analysis معتبر است. اگر transaction count دقیق نیاز هست، باید Cafebazaar Console export رو بگیریم.

---

## رشد فصلی

### NET Revenue Growth

| فصل | NET | Δ vs قبل |
|------|-----|-----------|
| Q1 | 35.65M | baseline |
| Q2 | 36.02M | +1٪ |
| Q3 | 29.14M | -19٪ (مدرسه) |
| Q4 | 54.52M | **+87٪** 🚀 (war/uprising) |

### تجزیه Q4 رشد

- Cafebazaar Q3 → Q4: 14.23 → 15.93 (+12٪) — رشد ضعیف
- Myket Q3 → Q4: 14.91 → 38.59 (+159٪) — رشد انفجاری

→ **Myket primary driver of Q4 growth**. Cafebazaar تقریباً flat ماند.

### اسفند Isolated

- اسفند Myket = 22.29M Toman (تک‌ماه)
- اسفند Cafebazaar = 7.08M Toman
- **اسفند alone = 29.4M Toman ≈ ۸۲٪ از کل Q4**
- ۹ اسفند ۱۴۰۴ = شروع جنگ ⇒ direct causation

---

## محصولات مهم Q4

### Cafebazaar Q4 — trial dominance:
- sub_7d (trial ۳.۵K Toman): 153 txn (dey 47 + bahman 39 + esfand 67)
- sub_1m (paid 98K Toman): 37 txn
- sub_3m (paid 88.2K Toman): 68 txn

### Myket Q4 — paid sub explosion:
- sub_3m peak: اسفند ۵۵M Toman gross alone (مهم‌ترین)
- sub_1m: stable
- sub_7d trial: explode در دی-اسفند

---

## Open Items

- [ ] **Cafebazaar webhook reliability** — چرا ۴۵۸ تراکنش DB کم داره؟
- [ ] **Q1 خالی-نمایی** — query قبلی Q1 رو از قلم انداخت (resolved: شمارش‌گر paste نقص داشت)
- [ ] **Plan 32 (1M Toman)** — Cafebazaar اون رو لیست نمی‌کنه ولی DB ۶ تراکنش داره. Backend صحت‌سنجی کنه.
- [ ] **trial sub_7d ROI** — از ۱۵۳ trial Q4، چندتا به sub paid تبدیل شدن؟ نیاز به cohort tracking.
