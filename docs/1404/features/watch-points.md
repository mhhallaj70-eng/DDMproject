# امتیاز تماشا (Watch Points)

**دوره**: 19 فروردین - 16 اسفند 1404 (سال کامل)

---

## 📊 خلاصه کلی

| متریک | مقدار | یادداشت |
|-------|--------|---------|
| **کل امتیاز** | 98.747M | از تمام فیچرها |
| **روزهای فعال** | 365 | سالانه کامل |
| **میانگین روزانه** | 270,000 امتیاز | متغیر فصلی |
| **بالاترین روز** | 830,100 (13 اسفند) | 🔥 Nowruz peak |
| **پایین‌ترین روز** | 1,860 (10 دی) | 🔴 Server crash |

---

## 🎬 تفصیل اکشن‌ها

### **Watch (تماشا) - حاکم بر سیستم**
- **کل امتیاز**: ~51-52M (52% of all points)
- **الگو**: متغیر روزانه 10K-800K
- **Peak**: 830K (13 اسفند - نوروز peak)
- **نتیجه**: primary engagement metric

### **Claim (ادعا/دریافت) - دوم اهمیت**
- **کل امتیاز**: ~20-22M (22% of all points)
- **الگو**: 28K-1.5M روزانه
- **Peak days**: mid-August (1.5M), early June (1M+)
- **نتیجه**: reward claiming highly incentivized

### **Got View (دریافت بازدید)**
- **کل امتیاز**: ~15-17M (16% of all points)
- **الگو**: 600-200K روزانه (mostly small)
- **Spike**: January+ (170K-210K/روز بعد از crash)
- **نتیجه**: steady background engagement

### **Got Like (دریافت لایک)**
- **کل امتیاز**: ~7-9M (8% of all points)
- **الگو**: 30K-35K متوسط، اما seasonal
- **Peak**: January+ (5K-6K/روز نیستند صحیح - data incomplete)
- **نتیجه**: minor contributor

### **Spinner (چرخش)**
- **کل امتیاز**: ~3-4M (3% of all points)
- **الگو**: 6K-50K روزانه
- **Peak**: May-Oct (20K-40K)
- **Low**: Summer/Winter edges
- **نتیجه**: feature engagement but minor points

### **Invite Friends (دعوت)**
- **کل امتیاز**: ~1-2M (1-2% of all points)
- **الگو**: 1K-50K روزانه (spotty)
- **Peak**: Jan-Feb (50K/روز)
- **نتیجه**: تلاش‌های referral اما کم

### **Comment (نظر)**
- **کل امتیاز**: نزدیک 0 (< 1%)
- **الگو**: صفر یا اندک جدا
- **نتیجه**: قابلیت نگاه دوباره

---

## 📈 روند فصلی

### **فروردین (مارس 1404 شروع)**
```
Days 1-2: شروع آهسته (51K-240K watch)
Days 3-18: مثبت (275K-313K watch/روز)
Days 19-31: پایین‌تر (156K-205K watch/روز)
= فصل ضعیف شروع
```

### **تیر-مهر (ژوئن-سپتامبر - بحران)**
```
صدای بالا در Claim (450K-1.5M!)
Watch کاهش‌یافته (10K-400K)
→ Data anomaly یا event driving claim behavior?
```

### **بهمن-اسفند (دسامبر-مارس - Peak)**
```
Watch peak: 790K-830K/روز
Claim: 25K-70K/روز (متوازن)
Got_view: 50K-210K/روز
= strongest season
```

### **دی (ژانویه - Server Crash)**
```
Days 9-27: catastrophic drops
Watch: 1.8K-2.7K (99.7% loss!)
Claim: 182K-441K (preserved?)
Got_view: 114K-202K (system fallback?)
= evidence of backup system
```

---

## 🔄 Claim Anomaly Investigation

**مشکل**: Claim امتیاز غیر‌متناسب زیاد (خاصه تابستان)

```
Expected: Claim = دریافت پاداش (claim reward actions)
Observed: 
  - June 19-30: 228K-1.5M (!!!)
  - August 14-31: 400K-900K (sustained!!!)
  - September 15-30: 700K-1.5M (!!!)

Hypothesis:
  A) Event driving massive rewards
  B) Batch reward payout for other features
  C) Misaligned metric definition
  D) Exploit/farming pattern
```

---

## 💡 نکات مهم

1. **Watch is king**: 52% of all points = primary retention lever
2. **Claim is mysterious**: تفاوت‌های بزرگ نشان‌دهنده batched payouts
3. **Seasonality extreme**: Peak (830K) = Low (1.8K) = **460x difference**
4. **Server reliability**: January crash obvious در data (99.7% drop watch)
5. **User behavior pattern**: Claim آیتم بالاست پایین‌ترین شامل

---

## 🎯 KPI Targets for 1405

| متریک | 1404 | هدف 1405 | ملاحظات |
|-------|------|---------|----------|
| **Total points** | 98.7M | 150M+ | +52% |
| **Watch %** | 52% | 60% | primary focus |
| **Avg points/user/day** | 179 | 250+ | +40% |
| **Peak period** | 830K | 1.5M | Nowruz campaign |
| **Summer dip reduction** | -70% | -30% | seasonal content |

---

**آخرین آپدیت**: 24 خرداد 1404
