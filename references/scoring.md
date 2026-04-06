# Code Sentinel — Scoring System

## Category Weights

| # | Category                    | Weight |
|---|----------------------------|--------|
| 1 | Architecture               | 10     |
| 2 | Code Quality               | 8      |
| 3 | Application Security       | 15     |
| 4 | AI/LLM Security            | 10     |
| 5 | Scalability/Performance    | 10     |
| 6 | Resilience/Reliability     | 10     |
| 7 | Database/Data Integrity    | 8      |
| 8 | API/Contracts              | 6      |
| 9 | Frontend/Technical UX      | 5      |
| 10| Observability/Operations   | 6      |
| 11| Tests/Delivery Reliability | 7      |
| 12| DevOps/Production          | 3      |
| 13| Compliance/Governance      | 2      |

**Total weight: 100** (when all categories are applicable)

## Handling Non-Applicable Categories

When a category is not applicable (e.g., no AI usage, no frontend), redistribute its weight
proportionally across the remaining categories, OR compute the weighted average using only
the applicable categories. The second approach is simpler and preferred:

```
Final Score = Σ(score_i × weight_i) / Σ(weight_i)  [for applicable categories only]
```

Always note which categories were marked non-applicable and why.

## Classification Tiers

| Score Range | Classification                  |
|-------------|--------------------------------|
| 0.0 – 2.0  | 🔴 Critical                    |
| 2.0 – 4.0  | 🔴 Very Weak                   |
| 4.0 – 6.0  | 🟠 Weak / Risky                |
| 6.0 – 7.5  | 🟡 Acceptable with Caveats     |
| 7.5 – 8.5  | 🟢 Good                        |
| 8.5 – 9.2  | 🟢 Very Good                   |
| 9.2 – 10.0 | 🏆 Excellent / Premium Grade   |

## Scoring Guidelines

When assigning a score to each category:

- **0–1**: Completely absent or fundamentally broken. No effort visible.
- **2–3**: Minimal effort, major gaps, high risk. Basic awareness but inadequate execution.
- **4–5**: Partial implementation. Some good practices visible but significant gaps remain.
  Works for demos but not for production.
- **6–7**: Solid foundation with notable gaps. Could go to production with known risks.
  Most common practices are followed but advanced concerns are unaddressed.
- **8**: Well-implemented. Minor issues only. Follows industry best practices with
  few exceptions.
- **9**: Excellent. Proactive quality measures. Only minor improvements possible.
- **10**: Exceptional. Production-hardened, battle-tested, comprehensive. Rare to award.

Be honest. Most real-world projects score between 3 and 7. A score of 8+ means the team
has invested serious effort in that area. A 10 is almost never given.

## Vulnerability Severity Levels

Use these levels in the Vulnerabilities section:

- **Critical**: Actively exploitable, can lead to full system compromise, data breach,
  or complete service failure. Must fix before ANY production deployment.
- **High**: Significant risk under real-world conditions. Exploitable with moderate effort.
  Fix within the first sprint after discovery.
- **Medium**: Real risk but requires specific conditions or has limited blast radius.
  Should be addressed in the near term.
- **Low**: Minor improvement to security posture. Low probability or impact.
  Address as part of regular maintenance.

## Final Verdict Options

The report must conclude with exactly one of these verdicts:

1. **❌ FAILED FOR PRODUCTION** — Critical flaws that make production deployment irresponsible.
   The system poses real risk of data loss, security breach, or cascading failure.

2. **⚠️ APPROVED WITH MANY CAVEATS** — Can technically operate but carries significant risk.
   Multiple important issues need immediate attention. Only deploy if business urgency
   demands it, with a clear remediation timeline.

3. **⚠️ APPROVED WITH CAVEATS** — Reasonably solid but with known gaps that need attention.
   Can go to production with a risk-aware team and a plan to address findings.

4. **✅ GOOD FOR PRODUCTION** — Well-built system with minor improvements possible.
   Ready for production with normal operational oversight.

5. **✅ STRONG FOR PRODUCTION AT SCALE** — Robust, secure, well-tested, well-operated.
   Ready to handle significant scale with confidence.
