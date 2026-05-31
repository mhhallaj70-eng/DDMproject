# API Reference — Score Service

**Base URL:** `score.didimoon.com`  
**Version:** 1.0.0 | Framework: Fiber (Go)  
**Internal:** `http://172.17.10.203:3041/swagger/index.html`

---

## Endpoints by Group

### dashboard
| Method | Path | توضیح |
|--------|------|--------|
| GET | `/api/v1/achievement` | نمایش آیتم‌های achievement |
| GET | `/api/v1/club` | نمایش top کاربران کلاب |

### action — ثبت اکشن‌های کاربر (trigger اصلی score)
| Method | Path | توضیح |
|--------|------|--------|
| POST | `/api/v1/action/daily-login` | اکشن ورود روزانه |
| POST | `/api/v1/action/got_like` | اکشن دریافت لایک |
| POST | `/api/v1/action/market` | اکشن خرید |
| POST | `/api/v1/action/other` | سایر اکشن‌ها |
| POST | `/api/v1/action/spinner` | اکشن spinner |
| POST | `/api/v1/action/view` | اکشن view ویدیو |
| POST | `/api/v1/action/watch` | اکشن تماشای ویدیو |

### battle-pass
| Method | Path | توضیح |
|--------|------|--------|
| GET | `/api/v1/battle-pass/steps` | نمایش مراحل battle pass |

### chest
| Method | Path | توضیح |
|--------|------|--------|
| GET | `/api/v1/chest` | chest |
| POST | `/api/v1/chest` | ساخت chest جدید |

### converter
| Method | Path | توضیح |
|--------|------|--------|
| POST | `/api/v1/converter` | تبدیل (score به coin یا برعکس) |

### claim
| Method | Path | توضیح |
|--------|------|--------|
| POST | `/api/v1/claim` | دریافت جایزه |
| POST | `/api/v1/claim/box` | باکس تصادفی |

### coin-transfer
| Method | Path | توضیح |
|--------|------|--------|
| POST | `/api/v1/coin-transfer` | ساخت تراکنش |
| GET | `/api/v1/coin-transfer/packages` | پکیج‌های انتقال سکه |
| POST | `/api/v1/coin-transfer/request` | درخواست سکه |
| POST | `/api/v1/coin-transfer/request/check` | بررسی درخواست سکه |
| GET | `/api/v1/coin-transfer/requests` | لیست درخواست‌ها |
| GET | `/api/v1/coin-transfer/transactions` | تاریخچه تراکنش‌ها |

### daily-login
| Method | Path | توضیح |
|--------|------|--------|
| GET | `/api/v1/daily-login` | وضعیت ورود روزانه کاربر |
| POST | `/api/v1/visit` | ثبت بازدید کاربر |

### event
| Method | Path | توضیح |
|--------|------|--------|
| GET | `/api/v1/events` | رویدادهای صفحه home |

### expense
| Method | Path | توضیح |
|--------|------|--------|
| POST | `/api/v1/expense` | ثبت هزینه |

### profile / leaderboard
| Method | Path | توضیح |
|--------|------|--------|
| GET | `/api/v1/leaderboard` | لیدربورد v1 |
| GET | `/api/v1/totalscores` | مجموع امتیازات |
| GET | `/api/v2/leaderboard` | لیدربورد v2 |
| GET | `/api/v2/leaderboard/internal` | لیدربورد داخلی v2 |

### league
| Method | Path | توضیح |
|--------|------|--------|
| GET | `/api/v1/league/history` | تاریخچه لیگ |
| GET | `/api/v1/league/info` | اطلاعات لیگ فعلی |

### level
| Method | Path | توضیح |
|--------|------|--------|
| GET | `/api/v1/level` | نمایش سطوح |

### lottery
| Method | Path | توضیح |
|--------|------|--------|
| GET | `/api/v1/lottery` | قرعه‌کشی‌ها |
| POST | `/api/v1/lottery/buy` | خرید بلیط قرعه‌کشی |
| GET | `/api/v1/user/lottery` | قرعه‌کشی‌های کاربر |

### prosline (پرسلاین)
| Method | Path | توضیح |
|--------|------|--------|
| POST | `/api/v1/porsline/callback` | callback پرسلاین (نظرسنجی) |

### reward
| Method | Path | توضیح |
|--------|------|--------|
| GET | `/api/v1/province` | دریافت استان‌ها |
| GET | `/api/v1/reward` | جوایز |
| PUT | `/api/v1/reward/address` | آپدیت آدرس جایزه |
| POST | `/api/v1/reward/cancel` | لغو جایزه |
| POST | `/api/v1/reward/expense` | هزینه جایزه |
| GET | `/api/v1/user/reward` | جوایز کاربر |

### score
| Method | Path | توضیح |
|--------|------|--------|
| GET | `/api/v1/score` | امتیاز کاربر |

### spinner
| Method | Path | توضیح |
|--------|------|--------|
| GET | `/api/v1/spinner` | spinner v1 |
| POST | `/api/v1/spinner/respin` | چرخش مجدد |
| GET | `/api/v2/spinner` | spinner v2 |

### transfer
| Method | Path | توضیح |
|--------|------|--------|
| POST | `/api/v1/transfer` | انتقال score |

### user
| Method | Path | توضیح |
|--------|------|--------|
| POST | `/api/v1/user/buy/coin` | خرید سکه |

### medal
| Method | Path | توضیح |
|--------|------|--------|
| GET | `/api/v1/user/medal` | مدال‌های کاربر v1 |
| GET | `/api/v2/user/medal` | مدال‌های کاربر v2 |

### video
| Method | Path | توضیح |
|--------|------|--------|
| GET | `/api/v1/video/score` | امتیاز ویدیو |

---

## نکات کلیدی معماری
- **action endpoints** قلب سیستم score هستند — هر رفتار کاربر به یه action تبدیل میشه
- **v1 vs v2:** leaderboard، spinner و medal نسخه v2 دارن — احتمالاً نسخه بهبودیافته
- **porsline callback:** یکپارچگی با ابزار نظرسنجی ایرانی پرسلاین
- **converter:** endpoint تبدیل score↔coin
- **chest:** مشابه loot box — باز کردن جعبه تصادفی جایزه
- **province:** برای ارسال جوایز فیزیکی به آدرس کاربر
