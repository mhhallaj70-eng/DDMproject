# مرحله ۳: KPI Framework — اولویت‌بندی‌شده

**تاریخ**: ۲۴ مه ۲۰۲۶  
**Scope**: ۵ KPI اصلی (بدون اضافه‌کاری) بر اساس دو بخش:
1. **Health Metrics** (بقای پلتفرم)
2. **Growth & Monetization** (رشد درآمد)

---

## KPI Framework (۵ متریک اصلی)

### **KPI #۱: D1 Retention Rate** 📊 [RETENTION]
**اهمیت**: بسیار زیاد — سنگ‌بنای engagement  
**فرمول**: (New Users on Day N که روز N+1 برگشتند) / (New Users on Day N)  
**منبع داده**: GA4 + Custom User Table  
**محاسبه**: Daily (rolling cohort)  
**واحد**: % (درصد)

**نکات**:
- این متریک خطرناک‌ترین ضعف را نشان می‌دهد
- اگر D1 < 25%، مسئله بزرگی در experience اول وجود دارد

---

### **KPI #۲: D7 + D30 Retention** 📊 [RETENTION]
**اهمیت**: زیاد — الگوی بازگشت طولانی‌مدت  
**فرمول**: (Users Active on Day N+7 or N+30) / (New Users on Day N)  
**منبع داده**: GA4 + Custom User Table  
**محاسبه**: Weekly + Monthly cohort  
**واحد**: % (درصد)

**نکات**:
- D7 بیشتر از D1 کاهش پیدا می‌کند (عادی است)
- D30 نشان‌دهنده اینکه کاربر "دائمی" یا "موقتی" است

---

### **KPI #۳: Conversion Rate to Payer (%) ** 💰 [REVENUE]
**اهمیت**: زیاد — چند درصد کاربر واقعا پول می‌دهند؟  
**فرمول**: (Unique Users who made ≥1 purchase) / (Total Active Users) × ۱۰۰  
**منبع داده**: DB Query (transaction table)  
**محاسبه**: Daily, Weekly, Monthly  
**واحد**: % (درصد)

**نکات**:
- این metric کوچک است اما حیاتی
- اگر < 2% ، مشکل سرجوش درآمد وجود دارد

---

### **KPI #۴: ARPU (Average Revenue Per User)** 💰 [REVENUE]
**اهمیت**: زیاد — میزان درآمد فی هر کاربر  
**فرمول**: (Total Revenue این دوره) / (DAU یا Monthly Active Users)  
**منبع داده**: DB Query (revenue table)  
**محاسبه**: Daily, Weekly, Monthly  
**واحد**: ریال یا USD

**نکات**:
- ARPU = ARPPU × Conversion Rate
- اگر conversion بالا باشد اما ARPU کم، problem در pricing یا bundle size است

---

### **KPI #۵: Gamification Engagement Score** 🎮 [GAMIFICATION]
**اهمیت**: متوسط‌تا‌زیاد — نسبت فعالیت گیمیفیکیشن  
**فرمول**:  
```
(Unique Users who completed ≥1 mission today + Unique Users who earned medal + 
 Unique Users who participated in league) / DAU
```
**منبع داده**: DB Query (mission, medal, league tables)  
**محاسبه**: Daily  
**واحد**: % (درصد)

**نکات**:
- این یک "engagement proxy" است
- باید رشد کند: برهم‌خورده‌ای از expansion loop است

---

## ساختار KPI منتخب

| KPI | Category | Priority | Data Source | Frequency | تاثیر |
|-----|----------|----------|-------------|-----------|--------|
| D1 Retention | Health | 🔴 High | GA4 + DB | Daily | اساسی |
| D7 + D30 Retention | Health | 🔴 High | GA4 + DB | Weekly | الگو |
| Conversion to Payer | Revenue | 🔴 High | DB | Daily | فرصت |
| ARPU | Revenue | 🔴 High | DB | Daily | اثر درآمد |
| Gamification Engagement | Growth | 🟡 Medium | DB | Daily | سیاق |

---

## چرا این ۵ متریک؟

✅ **بپوشش می‌دهند 3 بخش Critical**:
1. **Retention** (۲ KPI): آیا کاربران برمی‌گردند؟
2. **Revenue** (۲ KPI): چند درصد و چقدر می‌دهند؟
3. **Engagement** (۱ KPI): سیستم گیمیفیکیشن کار می‌کند؟

✅ **سادگی**: ۵ عدد فقط — قابل پیگیری هفتگی

✅ **مستقل ولی متصل**: 
- اگر Retention کاهش یابد، ARPU و Conversion متاثر می‌شوند
- اگر Gamification Engagement بالا باشد، Retention بهتر است

---

## بیرون‌رفته‌ها (Excluded)

❌ **Session Duration** — تفصیلی بیش‌از‌حد برای استراتژی

❌ **Medal Types Distribution** — درون‌غذایی است (زیرمتریک)

❌ **LTV** — برای الآن: داده کافی برای cohort بلندمدت ندارید

❌ **DAU Alone** — استفاده می‌شود در Retention و Gamification Engagement

---

## مرحله بعدی (۴)
**جمع‌آوری Baseline سال ۱۴۰۴**
