# Attribution & Measurement Infrastructure — استراتژی ۱۴۰۵

**نسخه:** Draft 1
**تاریخ:** 2 ژوئن 2026 (۱۲ خرداد ۱۴۰۵)
**Owner:** Product (تو) + Engineering Lead
**Status:** ⛔ **PAUSED** — منوط به restoration تیم (بخش ۷ گزارش فصلی)

---

## ⚠️ Critical Prerequisite (افزوده ۲ ژوئن ۲۰۲۶)

**این پلن در ۱۴۰۵ اجرا نمی‌شود.** علت: تیم فنی DDM در حال حاضر در حالت maintenance قرار دارد (۱ Tech Lead + ۱ Backend + ۱ Android، بدون Frontend/UI/UX/APM پس از تعدیل Q4 ۱۴۰۴).

**برای اجرای این پلن، حداقل bring-back لازم:**
- ۱ Frontend Developer (urgent)
- ۱ UI/UX Designer (urgent)
- ۱ Backend Developer extra (برای feature flag + A/B integration)
- پایداری compensation + insurance برای تیم فعلی + جدید

**این سند به‌عنوان reference آماده می‌ماند برای زمانی که:**
- تیم restore شد (Q1-Q2 ۱۴۰۵ یا later)
- یا scope کاهش یافت به lightweight version (فقط ClickHouse cohort + manual stats، بدون GrowthBook deploy)

تا آن زمان، استراتژی محصول ۱۴۰۵ = maintenance year (بخش ۵ + ۷ گزارش فصلی).

---

## ۱. Problem Statement

تمام ادعا‌های impact در گزارش ۱۴۰۴ unprovable هستند:

- آیا بهبود Stickiness Q4 از feature 5.3.1 (ربات DDM) بود یا از جنگ؟
- آیا Asemon revamp Q2 کار کرد یا Q4 recovery صرفاً external bounce-back بود؟
- کدام گیمیفیکیشن feature واقعاً adoption دارد و کدام نه؟
- ROI سرمایه‌گذاری دوبله ۵۰۲M Toman چقدر بود؟

**هیچ یک قابل اثبات نیست.** هیچ feature flag، A/B test، یا cohort tagging سیستماتیک نداریم.

برای ۱۴۰۵ که سال **«Sweat the existing assets»** است (optimization، نه launch جدید)، attribution **non-negotiable** است. بدون اون:
- نمی‌دونیم کجا سرمایه‌گذاری کنیم
- نمی‌دونیم چی کار کرد
- "گیمیفیکیشن زیر بار نرفته" hypothesis می‌مونه، نه fact
- در پایان ۱۴۰۵ به همین گزارش باز خواهیم گشت

این سند راه‌حل سیستماتیک می‌ده.

---

## ۲. روش‌های استاندارد صنعت

### مقایسه

| روش | شرح | causal proof | sample needs | پیاده‌سازی DDM |
|------|------|----------------|----------------|------------------|
| **A/B Test (RCT)** | random ۵۰/۵۰، measure delta | ⭐ Gold standard | متوسط-بالا | اولویت ۱ |
| **Multi-Arm A/B/C** | ۳+ variation همزمان | ⭐ | بالا | Phase 3 |
| **Progressive Rollout** | ۵٪→۲۵٪→۱۰۰٪ | ❌ (فقط safety) | کم | پیاده هست |
| **Cohort Pre/Post** | همان user قبل/بعد launch | ⚠️ weak (confounded) | کم | weak — اولویت پایین |
| **Difference-in-Differences** | exposed vs non-exposed، delta-of-delta | ✓ medium | متوسط | برای external shocks مفید |
| **Holdout Group (Long-term)** | ۵-۱۰٪ کاربر از features جدید محروم | ⭐ تجمعی | متوسط | Phase 3 |
| **Quasi-experiment (Geo/Platform)** | iOS vs Android، city A vs B | ⚠️ weak | بالا | secondary |

### ترکیب طلایی برای DDM

**A/B Test (primary) + Holdout Group (long-term aggregate)** + Diff-in-Diff برای دوره‌های شوک خارجی.

---

## ۳. Tool Recommendation

### مقایسه گزینه‌ها

| Tool | License | Self-host | Stats | DDM-fit | یادداشت |
|-------|---------|-----------|--------|-----------|-----------|
| **GrowthBook** ⭐ | MIT (open-source) | ✓ | Frequentist + Bayesian | ⭐⭐⭐ | top pick. ClickHouse integration native. |
| PostHog | MIT | ✓ | built-in | ⭐⭐ | alternative — اگه session replay هم می‌خوای |
| Statsig | freemium | cloud | strong | ❌ | data residency Iran → off-table |
| LaunchDarkly | enterprise | partial | external | ❌ | گران، over-kill |
| Optimizely | enterprise | cloud | strong | ❌ | data residency + cost |
| Unleash | open-source | ✓ | basic | ⚠️ | feature flag محدود، attribution ضعیف |
| Custom (ClickHouse + Python stats) | — | ✓ | manual | ⚠️ | کند، error-prone — فقط برای bootstrap |

### چرا GrowthBook؟

1. **Open-source MIT** — رایگان، self-host
2. **On-prem** قابل deploy روی infra DDM (نیاز به internet residency در ایران ندارد)
3. **Native ClickHouse adapter** — همان warehouse فعلی شما، بدون migration
4. **Bayesian engine** — تصمیم با sample کوچک‌تر (مهم برای DDM با ۳۳K MAU)
5. **SDK کامل** — Go، Node، Python، iOS، Android
6. **UI ساده** — non-engineer (PM، designer) می‌تونه experiment تعریف کنه

### Total Cost of Ownership (تخمین سال اول)

| آیتم | هزینه |
|------|--------|
| GrowthBook self-host (server + DB) | ~$100/ماه × ۱۲ = $1,200 |
| ClickHouse storage extra برای event volume | ~$50/ماه × ۱۲ = $600 |
| Eng time setup (one-time) | ~۸-۱۰ هفته دو نفر (DevOps + Backend) |
| Mobile SDK integration | ~۲-۳ هفته یک نفر |
| PM training | ~۲ روز |
| **سال اول جمع** | ~$2,000 + ~۳۰۰ ساعت eng |

نسبت به impact (تصمیمات قابل اثبات روی ۲۲ میلیارد تومان revenue) — توجیه‌شده.

---

## ۴. چالش‌های Scale-Specific DDM

با ~33K MAU (Q4 peak):

| ابعاد | مقدار | تأثیر |
|--------|--------|---------|
| MAU Q4 | 33K | sample size محدود ولی sufficient برای engagement metrics |
| MAU Q3 | 21K | low-season test = slower convergence |
| DAU avg | ~5K | A/B در DAU-dependent metrics slow |
| Paid users base | ~۱K/فصل | revenue metrics → ۸-۱۲ هفته per test |
| Trial→Paid conversion | ۲.۵۳٪ | A/B روی این متر = نیاز به ۸-۱۰K trial per arm |

**Implication:**
- A/B روی **engagement metrics** (completion rate، session length، return rate): **۲-۴ هفته** کافی
- A/B روی **revenue metrics** (paid conversion، ARPPU): **۸-۱۲ هفته** minimum
- A/B روی **30-day retention**: **حداقل ۸ هفته** observation post-exposure

---

## ۵. Phasing ۱۴۰۵

### Phase 1 — Foundation (Q1 ۱۴۰۵: فروردین–خرداد)

**هدف:** زیرساخت ready، اولین pilot.

| Week | کار | Owner |
|------|-----|--------|
| ۱-۲ | Deploy GrowthBook self-hosted | DevOps |
| ۱-۲ | تعریف Standard Events + Naming convention | Product + Data |
| ۲-۳ | ClickHouse → GrowthBook event pipeline | Backend |
| ۳-۵ | SDK integration در Mobile (iOS + Android) | Mobile dev |
| ۴-۵ | Experimentation Playbook نوشتاری | تو |
| ۶ | PM training session | تو |
| ۶-۸ | **Pilot test 1 — Daily Missions count reduction** | Product |

**Deliverable پایان Q1:** اولین decision data-backed (Daily Missions ۵→۳ کار کرد یا نه)

### Phase 2 — Gamification Tests (Q2 ۱۴۰۵: تیر–شهریور)

**هدف:** هر گیمیفیکیشن feature core یک تست داشته باشه.

- ۲ test/ماه (rolling)
- ۶ test کامل تا پایان Q2
- اولویت‌ها (به ترتیب): Daily Missions، Spinner، Battle Pass، Streak، Referral، League

### Phase 3 — Optimization Scale-up (Q3 ۱۴۰۵: مهر–آذر)

**هدف:** Embed در workflow.

- هیچ feature ship نمی‌شه بدون PRD شامل: hypothesis + success metric + sample plan
- ۳-۴ test همزمان
- شروع revenue-based experiments (Plan tier، pricing، trial duration)
- Setup Holdout Group ۵٪ (long-term aggregate impact)

### Phase 4 — Decision Frameworks (Q4 ۱۴۰۵: دی–اسفند)

**هدف:** KPI scorecard هر feature.

- تصمیم Continue / Improve / Sunset برای هر feature گیمیفیکیشن
- گزارش فصلی ۱۴۰۵ بر اساس evidence نه correlation
- planning ۱۴۰۶ data-driven

---

## ۶. Full Test Backlog گیمیفیکیشن (Phase 2-3)

هر test شامل: Hypothesis | Variant A (control) | Variant B (treatment) | Success metric | Guardrail | Sample/Duration.

### Spinner

| # | Hypothesis | Treatment | Metric | Sample | Duration |
|---|-------------|-------------|---------|---------|-----------|
| S1 | Push ۳۰ دقیقه قبل reset → completion +۱۵٪ | push notification | daily completion rate | ۴K/arm | ۲-۳ هفته |
| S2 | Variable rewards (گاهی 2x) → repeat rate +۲۰٪ | random ۱۰٪ chance 2x | weekly spin sessions | ۵K/arm | ۴ هفته |
| S3 | "Win preview" در home → daily entry +۱۰٪ | home banner | daily Spinner entries | ۵K/arm | ۲-۳ هفته |
| S4 | Streak bonus (۷ روز پشت سر) → consistency +۲۰٪ | streak bonus visible | ۷-day completion streak | ۶K/arm | ۸ هفته |

### Daily Missions

| # | Hypothesis | Treatment | Metric | Sample | Duration |
|---|-------------|-------------|---------|---------|-----------|
| DM1 | کاهش از ۵→۳ ماموریت → completion rate +۲× | ۳ mission ساده‌تر | daily completion rate | ۵K/arm | ۴ هفته |
| DM2 | Personalized missions از watch history | algorithmic | mission relevance + completion | ۵K/arm | ۴ هفته |
| DM3 | Mission progress در multiple surface (home، profile) | surface visibility | completion rate | ۴K/arm | ۳ هفته |
| DM4 | Difficulty curve (easy→hard sequentially) | sequenced | daily streak | ۵K/arm | ۶ هفته |

### Battle Pass

| # | Hypothesis | Treatment | Metric | Sample | Duration |
|---|-------------|-------------|---------|---------|-----------|
| BP1 | Free track با rewards stronger → premium conversion +۳۰٪ | enhanced free track | conversion to premium | ۸K/arm | ۸ هفته |
| BP2 | Limited-time premium discount (۲۴h) → conversion lift | discount banner | premium purchase rate | ۶K/arm | ۴ هفته |
| BP3 | Progress visualization در onboarding | UX flow | first-week engagement | ۵K/arm | ۶ هفته |
| BP4 | Tier-based rewards visible upfront → completion +۱۵٪ | reward preview | full pass completion | ۵K/arm | ۸ هفته |

### Streak / Daily Login

| # | Hypothesis | Treatment | Metric | Sample | Duration |
|---|-------------|-------------|---------|---------|-----------|
| ST1 | Milestone rewards (۳، ۷، ۳۰ روز) → consistency +۲۵٪ | milestone visible | ۷-day return rate | ۵K/arm | ۸ هفته |
| ST2 | Streak recovery mechanic (skip ticket 1×/هفته) → comeback rate | recovery available | weekly returning users | ۴K/arm | ۶ هفته |
| ST3 | Smart reminder timing (بهترین زمان user) | ML-based timing | daily return rate | ۶K/arm | ۴ هفته |

### Referral (رفیقبازی)

| # | Hypothesis | Treatment | Metric | Sample | Duration |
|---|-------------|-------------|---------|---------|-----------|
| R1 | افزایش reward (۲×) → invite send +۴۰٪ | enhanced reward | invites sent per user | ۴K/arm | ۴ هفته |
| R2 | Post-purchase prompt timing → conversion | timing variation | invite acceptance | ۳K/arm | ۶ هفته |
| R3 | Messaging variations (۳ copy) | A/B/C copy | CTR + conversion | ۴K/arm | ۳ هفته |
| R4 | Referrer/Referee dual reward → both engagement | dual reward | both-side activation | ۵K/arm | ۸ هفته |

### League

| # | Hypothesis | Treatment | Metric | Sample | Duration |
|---|-------------|-------------|---------|---------|-----------|
| L1 | Leaderboard همیشه visible (home banner) → participation +۲۵٪ | home visibility | weekly league entries | ۶K/arm | ۴ هفته |
| L2 | Tier-based league (نه global) → competitive engagement | tiered structure | session length | ۸K/arm | ۶ هفته |
| L3 | Weekly reset notification → return rate | push notification | Monday return | ۴K/arm | ۴ هفته |

### Medals / Achievements (افتخار)

| # | Hypothesis | Treatment | Metric | Sample | Duration |
|---|-------------|-------------|---------|---------|-----------|
| M1 | Medal showcase در profile prominently → completion drive | profile redesign | medal earn rate | ۵K/arm | ۶ هفته |
| M2 | Rare medal notification → social sharing | system notif | share events | ۴K/arm | ۴ هفته |
| M3 | Progress bar برای next medal visible | progress visible | engagement on actionable medals | ۵K/arm | ۴ هفته |

### Coin Transfer

| # | Hypothesis | Treatment | Metric | Sample | Duration |
|---|-------------|-------------|---------|---------|-----------|
| CT1 | Social context (friends list) on transfer → use rate +۳۰٪ | friend list embedded | transfer count | ۴K/arm | ۶ هفته |

### Cinema (cross-stream)

| # | Hypothesis | Treatment | Metric | Sample | Duration |
|---|-------------|-------------|---------|---------|-----------|
| C1 | Invite-to-watch prompt در پایان VOD → cross-product activation | prompt visible | Cinema session count | ۸K/arm | ۶ هفته |
| C2 | Pre-scheduled co-watch events → repeat use | scheduled events | weekly repeat sessions | ۴K/arm | ۸ هفته |

**جمع کل:** ~۲۸ test idea. اگر ۲ test/ماه run کنیم، ۱۴۰۵ ظرفیت ~۲۰ test کامل دارد.

---

## ۷. Risks جدی

### R1. Sample-size famine در low-season
- **مسئله:** Q3 ۱۴۰۵ احتمالاً MAU پایین (مثل ۱۴۰۴). sample کافی برای significance نیست.
- **راه‌حل:** Bayesian stats (GrowthBook). schedule revenue tests در high-season فقط. queue تست‌ها.

### R2. External shock contamination
- **مسئله:** اگر در میانه test جنگ/اغتشاش رخ دهد، data spike شده و conclusion غلط.
- **راه‌حل:** monitor anomaly detection روی daily KPI. اگر spike > 2σ، تست را extend یا pause. استفاده از diff-in-diff برای shock periods.

### R3. فرهنگ "ship first, measure later"
- **مسئله:** PM می‌خواد سریع ship کنه بدون hypothesis.
- **راه‌حل:** PRD template اجباری شامل (a) hypothesis (b) success metric (c) sample plan (d) guardrail. هیچ PRD بدون sign-off data lead.

### R4. Opportunity cost test queue
- **مسئله:** هر test = ۲-۸ هفته. queue طولانی شدن.
- **راه‌حل:** parallel tests on independent surfaces (Spinner + Battle Pass + Referral همزمان OK چون مستقل). dependency mapping قبل از queue.

### R5. Statistical illiteracy تیم
- **مسئله:** PM/designer نمی‌دونن p-value، power، effect size چیه → تصمیم غلط.
- **راه‌حل:** training session ۲ روزه + experimentation playbook + review gate (هر experiment decision توسط data lead).

### R6. Test fatigue کاربر
- **مسئله:** اگر کاربر بین variation‌های زیاد رفت‌وآمد کنه، UX inconsistent.
- **راه‌حل:** sticky randomization (یک کاربر در یک variant می‌مونه از abstract به resolution).

---

## ۸. Standard Events باید تعریف شوند

قبل از اولین test، naming convention استاندارد:

| Category | Event | Properties |
|----------|--------|--------------|
| Session | `session_start` | user_id, platform, source |
| Engagement | `content_view`, `content_complete` | content_id, via, duration, completion% |
| Gamification | `mission_complete`, `spinner_use`, `league_join`, `battle_pass_progress`, `streak_day`, `medal_earn`, `referral_invite_send` | feature-specific props |
| Conversion | `trial_start`, `trial_to_paid`, `plan_purchase` | plan_id, payment_method, amount |
| Retention | `day_n_return` | n (1, 7, 28) |
| UX | `feature_view`, `feature_click` | screen, position |

تعیین این لیست **prereq شماره ۱** است.

---

## ۹. Experimentation Playbook (خلاصه — سند جدا)

هر experiment شامل:

```
# Experiment: <name>
## Hypothesis
اگر X کنیم، Y به اندازه Z افزایش/کاهش می‌یابد، به علت <reasoning>.
## Variants
- Control (A): <current state>
- Treatment (B): <change>
## Primary metric
<metric, expected delta, baseline, MDE>
## Guardrail metrics
<metrics that should NOT degrade beyond X>
## Sample size calculation
<users per arm, baseline rate, power, alpha>
## Duration
<weeks, based on sample acquisition rate>
## Decision rule
<if treatment beats control by Z with p<0.05 / Bayesian probability >X%, ship>
## Risks / dependencies
<external factors, exposure rules>
```

---

## ۱۰. Decision Items برای CEO/Eng Lead

پیش از kickoff این چارچوب، نیاز به تأیید:

| تصمیم | پیشنهاد | تأیید |
|--------|-----------|---------|
| Tool: GrowthBook self-hosted | ✓ | [ ] |
| Phase 1 capacity: DevOps + Backend + Mobile dev (۸ هفته) | ✓ | [ ] |
| Phase 1 pilot: Daily Missions (DM1 — count reduction) | ✓ | [ ] |
| Standard Events تعریف و sign-off | ✓ | [ ] |
| Experimentation Playbook اجباری برای هر PRD | ✓ | [ ] |
| ۵٪ Holdout Group بعد از Phase 2 | ✓ | [ ] |
| اولویت test‌ها (به ترتیب backlog) | پیشنهاد بالا | [ ] |

---

## ۱۱. KPI خود این Initiative (Meta)

برای اینکه بدونیم اون infra کار می‌کنه:

| KPI | Target ۱۴۰۵ |
|------|----------------|
| تعداد test کامل run شده | ≥۱۵ |
| % decision‌های feature که data-backed بودند | ≥۸۰٪ |
| Time-to-decision per test | ≤۶ هفته میانه |
| تعداد feature‌های sunset/improved بر اساس result | ≥۴ |
| Statistical literacy score در تیم (quiz) | ≥۸۰٪ |

---

## ۱۲. ارتباط با بخش‌های دیگر گزارش ۱۴۰۴

- بخش ۲ (User Growth) — stickiness Q4 currently unattributable
- بخش ۳ (Revenue) — Q4 in-app +۸۷٪ currently unattributable
- بخش ۴ (Content) — ROI ۵۰۲M Toman content unattributable per-title
- بخش ۵ (Features) — هر feature impact unprovable
- بخش ۱۰ (Q1 ۱۴۰۵ plan) — این initiative باید اولویت ۱ باشد

---

## ۱۳. Open Questions

- [ ] DevOps capacity چقدر آزاد است؟
- [ ] Eng Lead buy-in داریم یا نیاز به proposal جداگانه؟
- [ ] آیا backend integration ClickHouse → GrowthBook نیاز به migration data دارد؟
- [ ] Mobile dev (iOS، Android) جداگانه‌اند یا یک نفر هر دو؟
- [ ] PM training را خودت اجرا می‌کنی یا outside trainer؟
- [ ] Pilot test ۱ روی همه کاربران یا segment خاص؟
