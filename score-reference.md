# DDM Score - مرجع فشرده

## Actions (امتیاز هر اکشن)
Watch=10 | Invite=500 | Comment=100 | GotView=1 | GotLike=1 | ClaimedScore=1

## Coin Transaction Type Mapping (`user_coin_history.type`)
> Source: کد `settings.go` (CoinHistory const) — تأیید با data ✓

| type | direction | name (code) | تفسیر فارسی |
|------|-----------|-------------|-------------|
| 1 | EARN | DAILY_LOGIN | پاداش ورود روزانه |
| 2 | EARN | SPINNER | جایزه چرخش |
| 3 | EARN | CLAIM | دریافت Battle Pass / Level / Mission |
| 4 | EARN | ADMIN | پاداش دستی ادمین |
| 5 | EARN | BOX | جایزه باکس |
| 6 | EARN | BUY_COIN | خرید سکه (پولی) |
| 7 | EARN | CANCEL_REWARD_BY_USER | refund لغو جایزه توسط کاربر |
| 8 | EARN | CANCEL_REWARD_BY_ADMIN | refund لغو جایزه توسط ادمین |
| 9 | EARN | RECEIVE_COIN | دریافت Coin Transfer |
| 10 | SPEND | SEND_COIN | ارسال Coin Transfer |
| 11 | SPEND | REWARD | خرید جایزه از فروشگاه |
| 12 | SPEND | LOTTERY | خرید بلیط قرعه‌کشی |
| 13 | SPEND | TICKET | بلیط سینما (-15 ثابت) |
| 14 | SPEND | PROFILE | تغییر تصویر پروفایل |
| 15 | SPEND | RE_SPIN | چرخش مجدد اسپینر (CoinToSpin=3) |
| 16 | EARN | LEADERBOARD | جایزه لیگ |
| 17 | system | FORCE | استفاده سیستمی |

## Action ID Mapping (`detail_scores.action`, `user_actions.action`)
> Source: کد `settings.go` (LIKE_ACTION ... VERSION_ACTION)

| id | name (code) | امتیاز پیش‌فرض | تفسیر |
|----|-------------|----------------|-------|
| 1 | LIKE_ACTION | - | لایک کردن |
| 2 | COMMENT_ACTION | 100 | نظر دادن |
| 3 | WATCH_ACTION | 10 | تماشای ویدیو |
| 4 | INVITE_FRIENDS_ACTION | 500 | دعوت دوست |
| 5 | SUBSCRIBE_ACTION | - | خرید اشتراک |
| 6 | DAILY_VISIT_ACTION | 1..5 | ورود روزانه |
| 7 | COMPLETE_PROFILE_ACTION | - | تکمیل پروفایل |
| 8 | SPINNER_ACTION | - | چرخش اسپینر |
| 9 | FIRST_LOGIN_ACTION | - | اولین ورود |
| 10 | MARKET_ACTION | - | بازار (cafe-bazaar/myket/google) |
| 11 | MEDAL_ACTION | - | کسب مدال |
| 12 | GOT_VIEW_ACTION | 1 | بازدید خوردن ویدیو (Creator) |
| 13 | GOT_LIKED_ACTION | 1 | لایک خوردن ویدیو (Creator) |
| 14 | OPEN_LINK_ACTION | - | باز کردن لینک (One-time mission) |
| 15 | UPLOAD_ACTION | - | آپلود ویدیو |
| 16 | CLAIM_ACTION | 1 | دریافت ماموریت |
| 17 | VERSION_ACTION | - | به‌روزرسانی نسخه |

## User Reward Status (`user_rewards.status`)
| id | name | فارسی |
|----|------|-------|
| 1 | FAILED | رد شده |
| 2 | WAITING | در انتظار تایید |
| 3 | ACCEPTED | تایید شده |
| 4 | SENDING | در حال ارسال |
| 5 | TAKEN | گرفته شده |
| 6 | CANCELED_BY_USER | لغو توسط کاربر |
| 7 | CANCELED_BY_ADMIN | لغو توسط ادمین |
| 8 | DRAFT | پیش‌نویس |

## Lottery Status (`lotteries.status`)
1=IN_PROCESS | 2=SOON | 3=FINISHED | 4=HIDDEN

## Reward Type (`rewards.type`)
1=Single | 2=Multiple | 3=SingleVisible | 4=MultipleVisible | 5=SingleCode | 6=SingleVisibleCode

## StepReward Type (`step_rewards.type`)
1=free-coin | 2=sub-coin | 3=free-score | 4=sub-score | 5=free-box | 6=sub-box | 7=free-lottery | 8=sub-lottery | 9=free-spinner | 10=sub-spinner | 11=coin-overload | 12=score-overload

## ConvertScore Type (`convert_scores.type`)
1=score | 2=spinner | 3=admin | 4=buy-coin | 5=cancel-reward-by-user | 6=cancel-reward-by-admin | 7=leader-board | 8=battle-pass | 9=mission | 10=level | 11=box

## Coin Transaction (`coin_transactions.type` و `.status`)
- type: 1=transfer | 2=request
- status: 1=waiting | 2=accepted | 3=canceled

## User Role (`users.role`)
1=admin | 2=editor | 3=league-editor | 4=reward-editor | 5=viewer | 6=shop-assistant

## User Status
1=ACTIVE | 2=SUSPENDED  
status of `step_rewards`: 1=NOT_CLAIMED | 2=CLAIMED

## DailyLogin Mode (settings)
1=DISABLE | 2=VISITOR (نیاز به claim) | 3=CLAIM (خودکار)

## InviteFriends Mode (settings)
1=INVITED | 2=INVITER | 3=BOTH

## Prize Type (level/box/spinner)
1=COIN | 2=SCORE | 3=BOX | 4=LOTTERY | 5=SPINNER | 6=REWARD | 7=FEATURE

## Settings کلیدی
- CoinToScore=100 (هر 100 امتیاز = 1 سکه)
- CoinToSpin=3 | ScoreCoefficient=1 (VIP)
- LeaderBoardCount=300 | OverallLeagueCoin=50000 | OverallInternalLeagueCoin=500
- HistoryLeagueCount=5 | SecondToScore=60 | ViewSecondToScore=60

## Daily Login (7 روز)
day: 1,2,3,4,5,6,7 → value: 1,1,2,2,3,3,5

## Club Spinner (وزن‌دار، مجموع=100)
reward(coin):weight → 0:5 | 1:30 | 5:30 | 10:20 | 15:10 | 25:3 | 50:1 | 100:1
**انتظار ریاضی ≈ 6.1 سکه/اسپین**

## Claim Spinner
همان مقادیر بالا

## Daily Login Settings
Disable | Visitor (نیاز به claim) | Claim (خودکار)

## Watch Setting (3 فلگ)
SubscriberUser × MCI Isp × MTN Isp → ترکیب‌ها تعیین می‌کنند کی واچ امتیاز می‌گیرد

## InviteFriends Setting
Invited | Both | Inviter

## LeaderBoard
just-for-sub-user / Level setting (غیرفعال‌سازی کلی)

## Medals (8 نوع × 5 سطح)
| level | Watch | Invite | Sub | Upload | Comment | GotView | GotLike | BuyCoin | daily |
|-------|-------|--------|-----|--------|---------|---------|---------|---------|-------|
| 1 | 200 | 3 | 30 | 10 | 25 | 1000 | 1000 | 250 | 7 |
| 2 | 800 | 10 | 90 | 50 | 50 | 2000 | 2000 | 1000 | 14 |
| 3 | 2000 | 15 | 180 | 100 | 100 | 5000 | 5000 | 2250 | 30 |
| 4 | 5000 | 50 | 365 | 250 | 250 | 10000 | 10000 | 12000 | 45 |
| 5 | - | 100 | - | - | - | - | - | 30000 | 90 |

## Daily Missions
- مجاز: Watch* | Invite | GotView | GotLike | like | Comment
- Prize: سکه | امتیاز* | کد قرعه‌کشی | چرخش مجدد | باکس
- Watch: 30min=1, 60min=3, 180min=2, 300min=4 (coin)
- Invite: 1=8, 3=26, 5=42
- GotView: 500=2, 2k=6, 5k=18, 8k=27, 12k=36, 20k=58, 30k=85
- GotLike: 50=2, 200=6, 500=18, 800=27, 1.2k=36, 2k=58, 3k=85

## One-time Missions
مجاز: CompleteProfile | OpenLink* | Market* | Ticket | Subscribe

## Battle Pass (سند اصلی - 1 هفته)
| step | score | free | sub |
|------|-------|------|-----|
| 1 | 500 | 1 | 5 |
| 2 | 1500 | 1 | 10 |
| 3 | 2500 | 1 | 10 |
| 4 | 3500 | 1 | 10 |
| 5 | 7000 | 2 | 20 |
| 6 | 10000 | 3 | 30 |
| 7 | 15000 | 5 | 50 |
| 8 | 20000 | 5 | 50 |
| 9 | 30000 | 10 | 100 |
| 10 | 50000 | 10 | 100 |
| FINAL | 70000 | - | 200 |
| OVERLOAD | 100000+ | - | 10 (تکرار) |

Type: NORMAL | FINAL* | OVERLOAD**

## Level (سطح کاربری 1-100)
pace: 1-2=10k | 2-10=5k | 11-15=10k | 16-20=15k | 20-32=20k | 33-100=100k
Prize: خالی | سکه | امتیاز | قرعه‌کشی | اسپین | باکس | فیچر

## Coin Transfer (روزی 1 بار)
amount → level: 50→- | 100→- | 250→- | 500→3 | 1k→6 | 2k→9 | 5k→12 | 7.5k→15 | 10k→30 | -1→50

## Box (وزن‌دار)
Prize types: سکه | امتیاز | کد قرعه‌کشی فعال | جایزه از فروشگاه

## Reward Types
- فیزیکی: Single | Multiple | MultipleVisible | SingleVisible
- غیرفیزیکی: SingleCode | SingleVisibleCode
- Status: Waiting | Accepted | Sending | Taken | Failed | CanceledByUser | CanceledByAdmin
- Specific: Normal-user | Subscriber-user

## Lottery Status
Soon | In_process | Finished | Hidden

## Season
- بدون فصل: gamification غیرفعال
- معمولاً 1 هفته
- شامل: لیگ + Battle Pass

## بخش‌های ناتمام در سند
Admin reward | User Suspend | Update total coin
