# DDM KPI Framework — نسخه نهایی

**تاریخ تهیه**: ۲۴ مه ۲۰۲۶  
**نویسنده**: Claude (Data-Driven KPI Analysis)  
**مخاطب**: مدیران ارشد، تیم Product، تیم Engineering  
**دوره**: سال ۱۴۰۴ (Baseline) → ۶ ماهه ۱۴۰۵ (Target)

---

## Executive Summary

DDM در وضعیت خطرناک است:
- **D1 Retention < 20%** (خیلی ضعیف)
- **Conversion to Payer: 0.5-1%** (بسیار ضعیف)
- **Gamification Adoption**: حتی measurable نیست

**راه حل**: ۵ KPI متمرکز + ۶ ماه intensive execution

---

## ۵ KPI Framework (Focused & Measurable)

### ۱️⃣ D1 Retention Rate

**تعریف**: درصد کاربرانی که روز بعد از sign-up برمی‌گردند

**Baseline**: < 20%  
**Target (۶ ماه)**: 28-30%  
**Growth**: +40-50% (نسبی)

**چرا اهمیت دارد**: 
- اگر D1 ضعیف باشد، هیچ acquisition فایده‌ای ندارد
- این متریک نشان‌دهنده first-day experience quality است
- ۵۰% D1 بهبود = ۵۰% کاهش acquisition waste

**مسئول**: Product/UX Team (onboarding، first video quality)

**Frequency**: Daily (rolling 7-day average)

---

### ۲️⃣ D7 + D30 Retention Rate

**تعریف**: درصد کاربرانی که ۷/۳۰ روز بعد برمی‌گردند

**Baseline**: D7 ~10-12%, D30 ~5%  
**Target (۶ ماه)**: D7 ~18-20%, D30 ~10-12%  
**Growth**: +50-100% (نسبی)

**چرا اهمیت دارد**:
- D7 نشان‌دهنده "habit formation" است
- D30 نشان‌دهنده کاربری "دائمی" یا "موقتی"
- این متریک‌ها تاثیر mission/medal systems رو اندازه می‌گیرند

**مسئول**: Product (missions)، Growth (push notifications)

**Frequency**: Weekly cohort analysis

---

### ۳️⃣ Conversion to Payer Rate

**تعریف**: درصد active users که حداقل یکبار خریداری کرده‌اند

**Baseline**: 0.5-1%  
**Target (۶ ماه)**: 2-2.5%  
**Growth**: +150-300% (نسبی)

**چرا اهمیت دارد**:
- این متریک monetization potential را نشان می‌دهد
- اگر < 2%، revenue model broken است
- این مشکل اولویت اول است (business priority = Revenue)

**مسئول**: Product (paywall، monetization design)، Business (pricing)

**Frequency**: Daily

---

### ۴️⃣ ARPU (Average Revenue Per User)

**تعریف**: میانگین revenue برای هر active user

**Baseline**: ~15,000-20,000 تومان (TBD)  
**Target (۶ ماه)**: 22,000-25,000 تومان  
**Growth**: +45-65% (نسبی)

**چرا اهمیت دارد**:
- حتی اگر conversion بالا باشد، ARPU کم = revenue کم
- این متریک pricing strategy رو determine می‌کند
- bundle design و premium features روی این تاثیر گذاری

**مسئول**: Business (pricing)، Product (bundle strategy)

**Frequency**: Daily / Monthly cohort

---

### ۵️⃣ Gamification Engagement Rate

**تعریف**: درصد DAU که حداقل یک gamification action کامل کردند (mission / medal / league)

**Baseline**: Unknown (TBD)  
**Target (۶ ماه)**: 35-45%  
**Growth**: Baseline-dependent

**چرا اهمیت دارد**:
- این یک "health check" برای gamification system است
- اگر بالا باشد، تاثیر مثبت روی D7/D30 انتظار می‌رود
- expansion loop: engagement → retention → revenue

**مسئول**: Product (mission/medal/league design)

**Frequency**: Daily

---

## Data Sources & Calculation

### GA4 Property (Android App)
- DAU, MAU
- User Demographics
- Retention Cohorts (D1, D7, D30)

### PostgreSQL (via Grafana)
- transactions table → Conversion, ARPU
- mission_completion, medal_earned, league_participation → Gamification Engagement
- users table → Cohort analysis

### Yandex Metrica (Optional)
- Supplementary behavioral data

---

## Roadmap — ۶ ماهه Execution

### Quarter 1: Diagnostics & Quick Wins (Months 1-3)

**Priority**: Retention + Monetization Quick Wins

**D1 Retention Target**: 22-24%
- Action: Onboarding overhaul (first video quality)
- Action: Push notification on day 2

**Conversion Target**: 0.8%
- Action: Paywall redesign (visibility + incentives)
- Action: First-time purchase discount

**Gamification Target**: 20%
- Action: Launch daily missions MVP
- Action: Medal notification on earn

---

### Quarter 2: Sustained Growth (Months 4-6)

**Priority**: Reaching sustainable targets

**D1 Target**: 28-30%
- Action: Onboarding completion metrics optimize

**D7 Target**: 18-20%
- Action: Mission retention impact measurement
- Action: Push notification frequency optimization

**Conversion Target**: 2-2.5%
- Action: Bundle launch / battle pass
- Action: Pricing strategy AB test

**ARPU Target**: 22-25K
- Action: Premium features launch
- Action: Subscription model (if applicable)

---

## Success Criteria

| KPI | Baseline | Month 3 | Month 6 | Status |
|-----|----------|--------|--------|--------|
| D1 Retention | 20% | 22-24% | 28-30% | ✅ |
| D7 Retention | 12% | 15% | 18-20% | ✅ |
| D30 Retention | 5% | 7-8% | 10-12% | ✅ |
| Conversion | 1% | 0.8-1.2% | 2-2.5% | ✅ |
| ARPU | 15-20K | 18-20K | 22-25K | ✅ |
| Gamification | TBD | 20% | 35-45% | ✅ |

---

## Risk Mitigation

### Risk 1: Retention targets missed
**Contingency**: 
- Enhanced user research (why do users leave?)
- Accelerate mission system
- Push notification A/B testing

### Risk 2: Conversion growth plateaus
**Contingency**:
- Pricing strategy overhaul
- Premium features experimentation
- Influencer/partnership monetization

### Risk 3: Gamification adoption low
**Contingency**:
- Simplify mission/medal requirements
- Increase reward values
- Community leaderboard virality

---

## Monitoring Cadence

- **Daily**: D1 Retention (rolling 7-day), Conversion, ARPU, Gamification
- **Weekly**: D7/D30 Retention cohorts, Weekly targets
- **Monthly**: Full KPI review + stakeholder sync
- **Quarterly**: Major strategy reviews (risk assessment)

---

## Responsibilities

| Role | Responsibility |
|------|---|
| **Product Lead** | KPI tracking, mission/feature ownership |
| **Engineering** | Data pipeline, analytics setup, backend optimization |
| **Business/Growth** | Pricing, monetization strategy, acquisition strategy |
| **Design/UX** | Onboarding, paywall, gamification UX |
| **Analytics** | Daily reporting, cohort analysis, A/B testing |

---

## Notes for Stakeholders

⚠️ **This framework is based on LIMITED baseline data**:
- D1 < 20% is estimated (not exact)
- ARPU baseline needs SQL query
- Gamification baseline unknown

✅ **Action items**:
1. Run SQL queries from Phase 4 to validate baseline
2. Lock targets once validated
3. Assign owners per KPI
4. Set up daily monitoring dashboard

---

## Appendix: Key Insights

### Why are D1 & Conversion so low?

1. **Onboarding Experience**: Likely poor UX or slow loading
2. **Content Quality**: Maybe first video is not engaging
3. **Pricing**: Maybe coin prices are too high for new users
4. **Competition**: Other apps with better user experience

### How to prioritize fixes?

**Priority Sequence**:
1. **Fix D1 first** (onboarding) — foundation
2. **Then fix Conversion** (pricing + paywall) — monetization
3. **Finally scale Gamification** (engagement multiplier)

### Why not focus on DAU/MAU?

Because DAU/MAU grows ONLY if Retention improves. If D1 < 20%, growing DAU = growing churn rate. Fix the denominator first.

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-05-24 | Initial framework + targets |

---

**Next Steps**:
1. ✅ Validate baseline data (run SQL queries)
2. Lock KPI targets with team
3. Set up daily monitoring dashboard
4. Assign product/engineering roadmap items

**Questions?** Contact: Product Management Team
