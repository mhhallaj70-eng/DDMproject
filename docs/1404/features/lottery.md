# قرعه‌کشی (Lottery - Seasonal)

**دوره**: 27 مرداد - 17 مهر 1404 (44 روز فقط!)

---

## 📊 خلاصه

| متریک | مقدار | یادداشت |
|-------|--------|---------|
| **فعالیت** | 44 روز | ⏰ فصلی، نه دائمی |
| **کل ورودی** | 6,897 | - |
| **کل سکه خرج** | 152,702 | - |
| **هزینه واحد** | ~19 سکه | Fixed price |
| **میانگین روزانه** | 157 ورودی | 3,470 سکه/روز |
| **بالاترین روز** | 523 ورودی | 7,733 سکه (8 مرداد) |
| **پایین‌ترین روز** | 38 ورودی | - |

---

## 📈 روند فعالیت

### **27 مرداد - 10 مهر (بالاترین فاز)**
```
27 مرداد: رویایش
28 مرداد: 5,282 سکه (278 ورودی)
29 مرداد: 7,733 سکه (407 ورودی) 🔥 PEAK
30 مرداد: 5,073 سکه (267 ورودی)
31 مرداد: 2,736 سکه (144 ورودی)
1 شهریور: 3,914 سکه (206 ورودی)
...
```

### **11 مهر - 17 مهر (پایانی)**
```
11 مهر: 988 سکه (52 ورودی)
...
17 مهر: آخرین روز (فیچر بسته شد)
```

### **الگو**
- 🔥 **Strong start**: روز 1-3 (5K-7K سکه)
- 📊 **Steady decline**: روز 4-15 (4K → 2K)
- 🔻 **Sharp drop**: روز 16-44 (1K → 100)
- ❌ **Shut down**: روز 45+ (0 activity)

---

## 💰 سکه خرج‌شده

### **توزیع روزانه**
```
پیک: 7,733 سکه (29 مرداد)
متوسط: 3,470 سکه
پایین: 38-500 سکه (پایانی)
```

### **نسبت به کل کسب‌شده**
```
Total lottery: 152,702 سکه
Total earned: 1,007,888 سکه
Ratio: 15.2% (of earned during 44-day period)
```

---

## 👥 Conversion & Participation

### **خلاصه**
- **کل ورودی**: 6,897
- **روزهای فعال**: 44
- **متوسط ورودی/روز**: 157
- **متوسط کاربران/روز**: ~82 (assumption)
- **Conversion to buy**: 157 ÷ 82 = 1.9 entries/user

---

## ⚠️ مشکلات

### **1. Seasonality Problem** 🔴
- **فقط 44 روز فعال است**
- **سال 1405 احتمالاً تکرار می‌شود**
- **موضوع**: چرا نه 365 روز؟

### **2. Sharp Decay** 🟠
- **روز 1-3**: peak
- **روز 4-15**: -70% decline
- **روز 16-44**: -90% more
- **علت**: ممکن است prizes تمام شود یا بیهوس شدن کاربران

### **3. Low Engagement During Off-Season**
- **44 روز ÷ 365 روز = 12% of year**
- **گمشده شده**: 321 روز بدون revenue این feature

---

## 🎯 Opportunities

### **1. Make Permanent (Most Important)**
```
اکنون:  44 روز/سال = 6,897 ورودی
اگر 365 روز: 57,000+ ورودی محتمل
درآمد اضافی: 1M+ سکه ممکن است
```

### **2. Seasonal Boosts**
- 🎉 **Launch event**: 2x multiplier (first 7 days)
- 🎁 **Holiday specials**: Extra prizes
- 🔥 **Weekend events**: Boost participation

### **3. Prize Structure Analysis**
- ❓ چه prizes داریم؟
- ❓ چرا drop روز 3-4 می‌افتد؟
- ❓ آیا prizes exhausted می‌شوند؟

---

## 📊 Comparison with Spinner

| متریک | Lottery | Spinner |
|-------|---------|---------|
| **Duration** | 44 days | 365 days |
| **Total entries** | 6,897 | 180,000 |
| **Coin revenue** | 152K | 98K |
| **DAU** | ~82 | ~208 |
| **Consistency** | 🔴 None | ✅ Daily |

---

## 🔄 Financial Impact

### **Revenue Comparison (44-day period)**
```
Lottery coins: 152,702
Spinner coins: 98,000 (285 days)
Ratio: Lottery is 55% more profitable per day!

اگر Lottery 365 روز بود:
152,702 × (365/44) = 1,267,000+ سکه!
```

---

## 🎯 KPI Targets برای 1405

| متریک | 1404 | هدف 1405 | راه‌حل |
|-------|------|---------|--------|
| **Duration** | 44 days | 365 days | ✅ Make permanent |
| **Total entries** | 6,897 | 50,000+ | 7x growth |
| **Coin revenue** | 152K | 1.2M+ | 8x growth |
| **DAU (avg)** | ~82 | 200+ | Better prizes |

---

## 💡 Recommendations

### **Priority 1 (فوری)**
- [ ] Analyze prize structure
- [ ] Identify drop-off reasons
- [ ] Design permanent lottery system

### **Priority 2 (طول سال)**
- [ ] Add seasonal events (2x/3x multipliers)
- [ ] Create progressive prize tiers
- [ ] Implement daily/weekly/grand prizes

### **Priority 3 (بهینه‌سازی)**
- [ ] A/B test prize amounts
- [ ] Optimize entry price (currently 19 coins)
- [ ] Add limited-time boosts

---

**آخرین آپدیت**: 24 خرداد 1404
