# API Reference — Asemon (UGC Service)

**Base URL:** `asemon-api.didimoon.com`  
**Version:** 1.0.0 | Framework: Fiber (Go)  
**Swagger:** https://asemon-api.didimoon.com/swagger/index.html

---

## Endpoints by Group

### bookmark
| Method | Path | توضیح |
|--------|------|--------|
| POST | `/v1/bookmark/{id}` | افزودن بوکمارک |
| DELETE | `/v1/bookmark/{id}` | حذف بوکمارک |
| GET | `/v1/bookmarks` | لیست بوکمارک‌های کانال |

### explore
| Method | Path | توضیح |
|--------|------|--------|
| GET | `/v1/campaign` | کمپین |
| GET | `/v1/campaign/next/{id}` | ویدیوهای بعدی کمپین |
| GET | `/v1/explore` | صفحه اکسپلور |
| GET | `/v1/explore/related/{id}` | ویدیوهای مرتبط |
| GET | `/v1/following/videos` | ویدیوهای دنبال‌شده‌ها |
| GET | `/v1/video/{id}` | اطلاعات یک ویدیو |

### category
| Method | Path | توضیح |
|--------|------|--------|
| GET | `/v1/category` | لیست دسته‌بندی‌ها |
| POST | `/v1/category` | ساخت دسته‌بندی کانال |

### follow
| Method | Path | توضیح |
|--------|------|--------|
| GET | `/v1/channel/follower` | فالوورهای کانال |
| GET | `/v1/channel/following` | کانال‌هایی که دنبال می‌کند |
| POST | `/v1/follow/{channel_id}` | فالو کردن کانال |
| DELETE | `/v1/follow/{channel_id}` | آنفالو کردن کانال |

### profile
| Method | Path | توضیح |
|--------|------|--------|
| GET | `/v1/channel/info` | اطلاعات کانال |
| GET | `/v1/channel/videos` | ویدیوهای کانال |

### search
| Method | Path | توضیح |
|--------|------|--------|
| GET | `/v1/channels/search` | جستجو در کانال‌ها |
| GET | `/v1/videos/search` | جستجو در ویدیوها |
| GET | `/v1/videos/search/next/{id}` | ویدیوهای بعدی جستجو |

### comment
| Method | Path | توضیح |
|--------|------|--------|
| POST | `/v1/comment/like/{id}` | لایک کامنت |
| DELETE | `/v1/comment/like/{id}` | حذف لایک کامنت |
| POST | `/v1/comment/{id}` | ثبت کامنت |
| GET | `/v1/comments/{id}` | نمایش کامنت‌ها |

### event
| Method | Path | توضیح |
|--------|------|--------|
| POST | `/v1/event` | ثبت رویداد |

### notifications
| Method | Path | توضیح |
|--------|------|--------|
| GET | `/v1/notifications` | لیست نوتیفیکیشن‌های کانال |
| GET | `/v1/notifications/has-new` | وجود نوتیفیکیشن جدید |

### promotion
| Method | Path | توضیح |
|--------|------|--------|
| POST | `/v1/promotion` | ثبت پروموشن |

### upload
| Method | Path | توضیح |
|--------|------|--------|
| POST | `/v1/upload/change-thumbnail/video/{id}` | تغییر thumbnail |
| POST | `/v1/upload/hook/{id}` | callback پس از آپلود ویدیو |
| POST | `/v1/upload/thumbnail/video/{id}` | آپلود thumbnail |
| POST | `/v1/upload/video/request` | درخواست آپلود ویدیو |
| PUT | `/v1/upload/video/{id}` | ویرایش ویدیو |
| DELETE | `/v1/upload/video/{id}` | حذف ویدیو |
| GET | `/v1/upload/videos/finished` | ویدیوهای آپلود شده |

### video-like
| Method | Path | توضیح |
|--------|------|--------|
| POST | `/v1/video/like/{id}` | لایک ویدیو |
| DELETE | `/v1/video/like/{id}` | حذف لایک ویدیو |

### report
| Method | Path | توضیح |
|--------|------|--------|
| POST | `/v1/video/report/{id}` | گزارش ویدیو |

---

## نکات کلیدی
- این سرویس UGC (User Generated Content) دیدیمون است — آسمون
- تمام اکشن‌های کاربری روی ویدیو (آپلود، لایک، کامنت، فالو، بوکمارک) اینجا هندل می‌شه
- callback آپلود ویدیو (`/v1/upload/hook/{id}`) احتمالاً trigger کننده score action در سرویس score است
- event endpoint برای tracking رفتار کاربر
