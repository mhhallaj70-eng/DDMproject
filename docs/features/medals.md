# Medals (مدال‌ها) - Achievements & Badges

## Status
✅ **Complete** — Web + App (both platforms implemented)

## Overview
8 medal types × 5 levels each. Each medal tied to key gamification actions. Shown in profile with progress bar, animations, and notifications.

## Medal Types & Related Actions
| Medal | Action |
|-------|--------|
| 👁️ Viewer (تماشاچی) | Watch video |
| 🌟 Asmoon Star (ستاره آسمون) | Upload to Asmoon |
| 👑 Seen (دیدهشدن) | Get views on Asmoon video |
| ❤️ Popularity (محبوبیت) | Get likes on Asmoon |
| ✍️ Smart (عقل کل) | Post useful comment + get verified |
| 🤝 Friend Master (رفیقباز) | Invite friends |
| 🎫 Loyalty (وفاداری) | Buy subscription |
| 💰 Coin Buyer (خریدار سکه) | Buy coins |

## Levels Per Medal
5 levels per medal type, progressively harder thresholds (see score-reference.md for exact numbers)

## Technical Implementation
**Frontend:**
- Medal tab in profile
- Current level + progress bar per medal
- Medal animations on unlock
- Optional display on club/user page

**Backend:**
- Progress calculation logic per action
- Level storage per user per medal
- Auto-sequential advancement (next level starts after previous earned)
- Sync patterns for continued action tracking

## KPIs
- 40% of active users have ≥1 medal (3-month target)
- 30% completion rate per medal level (3-month target)
- 25% medal-driven DAU retention (3-month target)

## Growth Opportunities
- Connect medals to seasonal league achievements
- Medal comparison with friends (social proof)
- Share medals on social platforms
- Special rewards for completing all levels

## Challenges Addressed
- Real-time syncing delays → async + scheduled calculations
- Definition of "useful comment" → verification system in place
- Resource usage at scale → optimized async processing
