# Profile Feature - پروفایل کاربر

## خلاصه
صفحه پروفایل کاربر: نمایش هویت، فعالیت‌ها، لوگ‌ها، مدال‌ها، ویدیوهای آپلود/ذخیره. روی اپ کامل، وب جزئی.

## مشکل
- کاربران نیاز به جایی دارند تا هویت شخصی خود را ساخته و نشان دهند
- نیاز به دیدن فعالیت‌ها (فالور، ویدیو، مدال)
- سایر کاربران باید بتوانند پروفایل را ببینند و follow کنند

## فیچرها (APP ✅ | WEB ❌/partial)

### Profile Info Card
- نام کاربری، ID، بیو، آواتار ✅
- دادعت فالورز/فالوینگ ✅
- دکمه‌ی follow/unfollow ✅

### Content Tabs
- **آپلود شده**: ویدیوهای کاربر (آسمون) ✅ / WEB partial
- **ذخیره شده**: فقط برای کاربر خودش ❌
- فیلتر: جدیدترین، بیشتر بازدید، etc. ✅/❌

### Medals Section
- نمایش مدال‌ها با سطح و توضیح ✅ / WEB ❌

### Level Card  
- سطح فعلی + progress bar ✅
- بیشترین امتیاز از کدام اکشن ✅

### Followers List
- نمایش فالورز/فالوینگ ✅ / WEB ❌

## Requirements (فنی)
- User info API
- Profile edit API (نام، بیو، آواتار)
- Videos list API (uploaded, saved)
- Medals + level API
- Follow/unfollow
- Followers/following lists
- Basic tab navigation
- Video filters (newest, most viewed, etc.)

## KPIs (3 ماه)
- Daily returns: 25% users
- Follow rate via profile: 15%
- Profile update rate: 30% by day 3

## Release Plan
1. **Week 1**: Design (UI/UX)
2. **Week 2-3**: Backend APIs
3. **Week 4**: Full UI (frontend)
4. **Week 5**: QA + testing
5. **Week 6**: Launch + marketing

## Status
| Feature | App | Web |
|---------|-----|-----|
| Profile info card | ✅ | ❌ |
| Asmoon videos tab | ✅ | ❌ |
| Saved videos tab | ❌ | ❌ |
| Medals | ✅ | ❌ |
| Followers list | ✅ | ❌ |
| Follow/unfollow | ✅ | ❌ |

## Challenges
- Cache for loading optimization
- Managing many videos across tabs
- Privacy: show only user's own saved videos
- Access control: who can see what
