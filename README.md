# DDM Project

پلتفرم ویدیویی دیدیمون با سیستم گیمیفیکیشن — اسناد، KPI framework، dashboard، آرشیو مکالمات.

## 📂 ساختار

```
DDM/
├── score-reference.md              ⭐ مرجع گیمیفیکیشن (action, coin type, status enum)
├── ddm-business-dashboard.json     ⭐ Grafana dashboard (28 پنل، 8 row)
├── docs/
│   ├── kpi-framework-v2.md         ⭐ Framework فعلی (NSM 210M→420M، 7 KPI)
│   ├── databases-reference.md      ⭐ 3 DB schema (ClickHouse + Postgres + MySQL)
│   ├── features/                   مستندات فیچرها (18 فایل)
│   ├── prd/                        Master PRD
│   ├── 1404/                       برنامه سال 1404
│   └── archive/                    KPI v1 و فاز‌های قبلی
├── scripts/                        PowerShell scripts (git، sync)
└── conversations/                  آرشیو مکالمات Claude
```

## 🎯 اسناد اصلی (شروع از اینجا)

| فایل | محتوا |
|------|-------|
| [score-reference.md](score-reference.md) | همه enum های Score DB: action، coin type، reward status، voucher، lottery |
| [docs/kpi-framework-v2.md](docs/kpi-framework-v2.md) | Framework فعلی KPI (recalibrated 25 May 2026) |
| [docs/databases-reference.md](docs/databases-reference.md) | Schema سه دیتابیس + identity bridge |

## 📊 KPI Snapshot (May 2026)

| متریک | Baseline | Target 6M |
|--------|----------|-----------|
| Net Monthly Revenue ⭐ | 210M تومان | 420M (2x) |
| Checkout Completion 🚨 | 9.5% | 25% |
| Sub Paid Conversion | 1.14% | 2.5% |
| ARPPU (Sub Paid) | 775K تومان | 1M |
| Repeat Purchase Rate 🚨 | 11.9% | 20% |
| D7 Retention | ~12% | 18% |

**اولویت 6 ماه**: Fix Checkout → ARPPU → Retention → Acquisition

## 📁 فهرست فیچرها (docs/features/)

**محصولات اصلی**: VOD (main) | UGC (آس‌مون) | Cinema | Magazine | TV Live Stream

**Gamification**: Coin Transfer | Coin Purchase | Daily Login | Daily Missions | One-Time Missions | Spinner | Medals | League | Golden Path | User Leveling | Battle Pass

**Other**: Profile | Referral | Shop Rewards | Age Rating

## 📜 فهرست مکالمات

| تاریخ | عنوان | فایل |
|------|------|------|
| 2026-05 | DDM Score Configuration Setup | [اینجا](conversations/2026-05_ddm-score-configuration.md) |
| 2026-05 | Customize Claude to your role | [اینجا](conversations/2026-05_customize-claude-role.md) |
| 2026-05 | Point Claude at any folder | [اینجا](conversations/2026-05_point-claude-at-folder.md) |
| 2026-05 | Schedule a recurring task | [اینجا](conversations/2026-05_schedule-recurring-task.md) |

## 🔄 نحوه به‌روزرسانی

مکالمات جدید از طریق scheduled task به‌طور خودکار اضافه و کامیت می‌شوند (`scripts/sync-conversations.ps1`).
