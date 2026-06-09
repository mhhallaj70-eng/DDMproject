# DDM (دیدیمون) — Product Knowledge Base

پلتفرم ویدیویی ایرانی با سیستم گیمیفیکیشن.

> **برای هر کسی که با این ریپو آشنا نیست:** از `DDM_Project_Instruction.md` شروع کن — همه چیز درباره محصول، تیم، استراتژی، و قراردادهای کاری آنجاست.

---

## ⚡ وضعیت فعلی (ژوئن ۲۰۲۶)

| موضوع | وضعیت |
|-------|--------|
| **تیم** | ۴ نفر — Maintenance Mode (Tech Lead + Backend + Android + PM) |
| **هدف ۱۴۰۵** | Sweat existing assets — هیچ feature جدید بدون restoration تیم |
| **درآمد baseline** | ۱۷۵M تومان/ماه (بعد از حذف Whale plan) |
| **هدف ۶ ماهه** | ۵۰۰M+ تومان/ماه (با fix trial funnel) |
| **بزرگ‌ترین مشکل** | Trial→Paid: 2.53% (benchmark 5-15%) |
| **Attribution** | ⛔ PAUSED تا restoration تیم |

---

## 📂 ساختار ریپو

```
DDM/
├── DDM_Project_Instruction.md   ⭐ شروع از اینجا — context کامل محصول
├── score-reference.md           ⭐ مرجع فشرده سیستم امتیاز (enums، IDs، configs)
│
├── docs/
│   ├── databases-reference.md   ⭐ Schema سه دیتابیس (ClickHouse + Postgres + MySQL)
│   ├── kpi-framework-v3.md      ⭐ KPI فعلی (Trial-Centric، ۳۱ مه ۲۰۲۶)
│   ├── prd/
│   │   └── master-prd.md        PRD جامع محصول (۲۴ مه ۲۰۲۶)
│   ├── features/                Spec فیچرها (timeless — بدون داده سالانه)
│   ├── strategy/                اسناد استراتژیک ۱۴۰۵
│   ├── reports/                 گزارش‌های تحلیلی فصلی
│   ├── revenue/                 داده‌های درآمدی (cafebazaar، myket)
│   ├── queries/                 کوئری‌های مرجع
│   ├── 1404/                    تحلیل‌های سال ۱۴۰۴ (داده-محور)
│   │   ├── overview.md          خلاصه سال ۱۴۰۴
│   │   ├── features/            تحلیل per-feature با داده‌های ۱۴۰۴
│   │   └── ...
│   └── archive/                 فایل‌های منسوخ (KPI v1 و v2، فازهای قبلی)
│
├── dashboards/                  Grafana dashboard JSONs + SQL schemas
├── scripts/                     PowerShell (git sync، conversations)
└── conversations/               آرشیو مکالمات Claude
```

> **تفاوت `docs/features/` و `docs/1404/features/`:**
> - `docs/features/` = spec بی‌زمان هر فیچر (چه هست، چطور کار می‌کند)
> - `docs/1404/features/` = تحلیل عملکرد آن فیچر در سال ۱۴۰۴ با داده‌های واقعی

---

## 🎯 اسناد کلیدی

| فایل | محتوا | آخرین آپدیت |
|------|-------|-------------|
| [DDM_Project_Instruction.md](DDM_Project_Instruction.md) | Context کامل: محصول، تیم، KPI، قراردادهای کاری | ژوئن ۲۰۲۶ |
| [score-reference.md](score-reference.md) | همه enums و IDs سیستم امتیاز | sync with codebase |
| [docs/kpi-framework-v3.md](docs/kpi-framework-v3.md) | Framework KPI فعلی (Trial-Centric) | ۳۱ مه ۲۰۲۶ |
| [docs/databases-reference.md](docs/databases-reference.md) | Schema PostgreSQL + ClickHouse + MySQL | —— |
| [docs/prd/master-prd.md](docs/prd/master-prd.md) | PRD جامع تمام فیچرها | ۲۴ مه ۲۰۲۶ |
| [docs/strategy/revenue-plan-1405-reality-check.md](docs/strategy/revenue-plan-1405-reality-check.md) | Reality check پلن درآمدی CEO | ۲ ژوئن ۲۰۲۶ |
| [docs/strategy/attribution-measurement-1405.md](docs/strategy/attribution-measurement-1405.md) | استراتژی attribution (⛔ PAUSED) | ۲ ژوئن ۲۰۲۶ |
| [docs/reports/quarterly-1404-report.md](docs/reports/quarterly-1404-report.md) | گزارش فصلی ۱۴۰۴ | —— |

---

## 📊 KPI Snapshot (v3 — Trial-Centric)

```
Net Monthly Revenue: 175M تومان (baseline) → 500M+ هدف ۶ ماه

Trial Funnel (بزرگ‌ترین leak):
  1,711 Trial DRAFT
      ↓ 19% activation
    ~325 activated
      ↓ 2.53% paid (benchmark: 5-15%)
      ~8 paid  ←  اینجا باید ۵× بشه
```

| KPI | Baseline | هدف ۶M |
|-----|----------|--------|
| Net Monthly Revenue ⭐ | 175M تومان | 500M+ |
| Trial→Paid Conversion 🚨 | 2.53% | 8%+ |
| Checkout Completion | 12.8% | 25% |
| Sub Paid Conversion | 1.14% | 2.5% |
| ARPPU (Sub Paid) | 775K تومان | 1M+ |
| Plan 2 (3ماهه) Champion | 36.5% conv | حفظ |

**اولویت استراتژیک**: Fix Trial→Paid → Trial Activation UX → Catalog Simplify → Real Checkout → ARPPU

---

## 🎮 فیچرهای محصول

**محصولات اصلی**: VOD | Asmoon (UGC) | Cinema | Magazine | Live TV

**Gamification (کامل و فعال)**:
Score/Level | Daily Login | Daily Missions | One-Time Missions | Battle Pass | Golden Path | Spinner | League | Medals | Shop | Coin Transfer | Coin Purchase | Referral (رفیق‌بازی)

**Other**: Profile | Age Rating

> ⚠️ **قانون داده**: مقادیر DB در **ریال** است — برای تومان همیشه ÷ ۱۰

---

## 📜 مکالمات آرشیو

| تاریخ | موضوع |
|-------|-------|
| 2026-05 | [DDM Score Configuration](conversations/2026-05_ddm-score-configuration.md) |
| 2026-05 | [Customize Claude Role](conversations/2026-05_customize-claude-role.md) |
| 2026-05 | [Point Claude at Folder](conversations/2026-05_point-claude-at-folder.md) |
| 2026-05 | [Schedule Recurring Task](conversations/2026-05_schedule-recurring-task.md) |

---

## 🔄 نحوه به‌روزرسانی

- مکالمات جدید از طریق `scripts/sync-conversations.ps1` کامیت می‌شوند
- بعد از هر سشن کاری با Claude: فایل مربوطه در `docs/` آپدیت + `DDM_Project_Instruction.md` sync شود
