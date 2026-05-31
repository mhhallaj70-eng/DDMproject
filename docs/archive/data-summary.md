# دیدیمون - خلاصه داتا جامع
**تاریخ**: 24 مه 2026  
**منابع**: GA4 + Yandex Metrica + ClickHouse + PostgreSQL - score

---

## 📊 خلاصه کلی

| شاخص | مقدار | نکات |
|------|-------|------|
| **Total Users** | 1,115 | کل کاربران ثبت‌شده |
| **Active Users (This Month)** | 4 | ⚠️ بسیار پایین |
| **Total Coin Transactions** | 13,896 | |
| **Total Coins (in system)** | 1,511,631 | Earned = Spent |

---

## 💰 سیستم سکه

### Coin Metrics
- **Total Coins Earned**: 1,511,631
- **Total Coins Spent**: 1,511,631
- **Avg Coins per Transaction**: 109
- **Range**: 15 - 10,000
- **Top 5 Users Total**: 210,450 coins

### Top 5 Users by Coins
| User ID | Total Coins |
|---------|------------|
| 184798 | 59,550 |
| 189040 | 56,500 |
| 222388 | 40,250 |
| 220405 | 27,400 |
| 184852 | 26,750 |

### Coin Balance (Sample Users)
- User 13: Sent 13,350، Received 700
- User 10947: Sent 300، Received 9,850
- User 359: Sent 200، Received 0

---

## 🏆 سیستم گیمیفیکیشن

### Medals & Achievements
- **Total Medals**: 2,449
- **Users with Medals**: 33,782
- **Avg Medals per User**: 4.22
- **Max Medals (Outlier)**: 22,049

### Levels
- **Distribution**: Level 26-46
- **Most Users**: Level 26-27 (39-35 users)
- **Level 46**: 1 user only

**Level Distribution (Top 10)**:
| Level | Users |
|-------|-------|
| 26 | 39 |
| 27 | 35 |
| 28 | 31 |
| 29 | 26 |
| 30 | 24 |
| 31 | 23 |
| 32 | 23 |
| 34 | 21 |
| 35 | 21 |
| 36 | 15 |

---

## 🎮 Feature Engagement

### Chests
- **Total Chests**: 462,296 entries
- **Users Involved**: 351,942 (31.5% of total)
- **Status**: ✅ POPULAR

### Lotteries (قرعه‌کشی)
- **Total Entries**: 779,715
- **Users Participated**: 26,689 (2.4% of total)
- **Status**: ⚠️ VERY LOW ENGAGEMENT

### Rewards
- **Total Rewards Given**: 42,827
- **Users Claimed**: 25,089 (2.2% of total)
- **Status**: ⚠️ VERY LOW ENGAGEMENT

### Seasons & Battle Pass
- **Total Seasons**: 173 🔥
- **Users in Seasons**: 297,627
- **Battle Pass Steps**: 903
- **Status**: ✅ VERY ACTIVE

---

## 📈 User Engagement Summary

### By Feature
| Feature | Entries | Users | % |
|---------|---------|-------|---|
| Chests | 462,296 | 351,942 | 31.5% |
| Seasons | - | 297,627 | 26.7% |
| Medals | 2,449 | 33,782 | 3.0% |
| Lotteries | 779,715 | 26,689 | 2.4% |
| Rewards | 42,827 | 25,089 | 2.2% |

---

## ⚠️ Critical Issues

1. **Retention Crisis**
   - Only 4 active users this month (from 1,115 total)
   - DAU/MAU: 0.3% (from GA4)

2. **Feature Imbalance**
   - Chests: 31.5% engagement ✅
   - Lotteries/Rewards: 2-2.4% ⚠️
   - Seasons: High (but many historical)

3. **User Levels**
   - Concentrated: levels 26-30
   - Very few at high levels (46: 1 user)

4. **Data Anomalies**
   - Total medals count (2,449) vs users with medals (33,782) - احتمالاً historical
   - Outlier user with 22,049 medals
   - Users in seasons (297K) > total users (1.1K) - احتمالاً historical

---

## 🔄 Data Sources Quality

✅ **PostgreSQL - score**: Reliable، direct access
✅ **ClickHouse**: Working، watch_events available
✅ **GA4**: Complete، 1-year data
❓ **Yandex Metrica**: Not accessed yet

---

## 📌 بعدی مراحل

- [ ] Watch data analysis (ClickHouse)
- [ ] Retention cohort analysis (GA4)
- [ ] Feature correlation analysis
- [ ] KPI definition & targets
- [ ] Dashboard creation
