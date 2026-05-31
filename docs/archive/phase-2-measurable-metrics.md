# مرحله ۲: شناسایی Metric‌های قابل اندازه‌گیری — DDM KPI Framework

**تاریخ**: ۲۴ مه ۲۰۲۶  
**منابع داده**: GA4 (Demo) + Yandex Metrica + Grafana/PostgreSQL  
**دوره Reference**: سال ۱۴۰۴ (baseline) + ۱۴۰۵ (current)

---

## ۱. RETENTION (اولویت اول)

### Metric‌های اصلی
| Metric | منبع | Accessibility | نکته |
|--------|------|---|------|
| **D0 = Installation/New Users** | GA4 | ✅ High | تعداد نصب یا sign-up روزانه |
| **D1 Retention** | GA4 + DB | ✅ High | % کاربرانی که روز بعد برگشتند |
| **D7 Retention** | GA4 + DB | ✅ High | % کاربرانی که ۷ روز بعد برگشتند |
| **D30 Retention** | GA4 + DB | ✅ High | % کاربرانی که ۳۰ روز بعد برگشتند |
| **Churn Rate** | DB Query | ✅ Medium | % کاربرانی که ۳۰ روز فعال نیستند |
| **Churned User Definition** | Business Logic | 🔴 TBD | چه تعریفی از "churned" استفاده می‌کنیم؟ |

### درجه اهمیت
- **D1 خیلی مهم**: دل‌کردی آنشین و experience اول
- **D7 و D30**: pattern تصمیم برای رقابت

---

## ۲. REVENUE & MONETIZATION (اولویت دوم)

### Metric‌های اصلی
| Metric | منبع | Accessibility | نکته |
|--------|------|---|------|
| **Coin Purchases** | DB Query | ✅ High | تعداد و ارزش خریدهای سکه |
| **ARPU** (مقدار متوسط پرداخت) | DB Query | ✅ High | Avg Revenue Per User |
| **ARPPU** | DB Query | ✅ High | Avg Revenue Per Paying User |
| **LTV** (Life Time Value) | DB Query | 🟡 Medium | نیاز به cohort analysis طولانی‌مدت |
| **Purchase Funnel** | DB Query | ✅ High | آیا کاربر دنبال خریداری می‌رود؟ |
| **Conversion Rate (%) to Payer** | DB Query | ✅ High | % کاربرانی که حداقل یکبار خریدند |
| **Repeat Purchase Rate** | DB Query | ✅ High | % کاربران که برای خریدهایی دوم برمی‌گردند |

### درجه اهمیت
- ARPU و Conversion یکی از اولویت‌های برجسته است
- نیاز به segmentation: new vs. mature users

---

## ۳. GAMIFICATION CONVERSION (اولویت سوم)

### ۳.۱ Medal & Achievement Completion
| Metric | منبع | Accessibility |
|--------|------|---|
| **Medal Earned Rate** | DB Query | ✅ High |
| **Unique Users Earning Medal** | DB Query | ✅ High |
| **Medal Types Distribution** | DB Query | ✅ High |
| **Avg Time to Medal** | DB Query | 🟡 Medium |

### ۳.۲ Mission Completion
| Metric | منبع | Accessibility |
|--------|------|---|
| **Daily Mission Completion Rate** | DB Query | ✅ High |
| **One-Time Mission Progress** | DB Query | ✅ High |
| **Mission Abandon Rate** | DB Query | 🟡 Medium |

### ۳.۳ League & Ranking
| Metric | منبع | Accessibility |
|--------|------|---|
| **Active League Participants** | DB Query | ✅ High |
| **League Leaderboard Movement** | DB Query | 🟡 Medium |
| **League Engagement vs Non-League** | DB Query | 🟡 Medium |

### ۳.۴ Score & Level Progression
| Metric | منبع | Accessibility |
|--------|------|---|
| **Avg User Score (per day)** | DB Query | ✅ High |
| **Score Distribution (by level)** | DB Query | ✅ High |
| **Level-Up Progression Rate** | DB Query | ✅ High |
| **Score Acquisition Source** (watch, comment, medal, etc.) | DB Query | ✅ High |

---

## ۴. ENGAGEMENT (پشتیبانی)

### Metric‌های ثانویه
| Metric | منبع | Accessibility |
|--------|------|---|
| **DAU (Daily Active Users)** | GA4 + Grafana | ✅ High |
| **Session Duration** | GA4 | ✅ High |
| **Watch Duration / Content Consumption** | GA4 Events | ✅ High |
| **Action Frequency (posts, comments, reactions)** | DB Query | ✅ High |

---

## خلاصه دسترسی

### ✅ تماماً در دسترس
- User Demographics (DAU, MAU, New Users)
- Retention Cohorts (D1, D7, D30)
- Coin Purchase Transaction Log
- Medal Completion Events
- Mission Progress
- Score Ledger
- Level Progression

### 🟡 جزئی / نیاز راهنمایی
- Yandex Metrica Events و Custom Properties
- Behavioral Funnel سفارشی (مسیر signup → watch → purchase)
- LTV Calculation (طول‌مدت طولانی)
- Churn Definition (چه تعریفی؟)

### 🔴 اطلاعات ناقص
- Database schema دقیق برای gamification
- API endpoints برای real-time data

---

## مرحله بعدی (۳)
**اولویت‌بندی KPI و انتخاب ۵-۷ متریک اصلی برای focus**
