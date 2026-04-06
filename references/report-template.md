# Code Sentinel — Report Template

Use this exact structure for the output report. Replace bracketed content with actual findings.

---

```markdown
# 🛡️ Code Sentinel — Production Readiness Report

**Project**: [project name]
**Date**: [YYYY-MM-DD]
**Tech Stack**: [languages, frameworks, databases, infra]
**Analyzed By**: Code Sentinel v1.0

---

## 1. Executive Summary

[Write 3-5 paragraphs in executive language covering:]
[- The overall system maturity level]
[- Whether it resembles a prototype, MVP, average system, or robust system]
[- Whether it is ready for serious production]
[- Whether it is ready to scale]
[- Key business risks]
[- Objective conclusion]

---

## 2. Overall Score

| # | Category | Score | Weight | Weighted | Comment |
|---|----------|-------|--------|----------|---------|
| 1 | Architecture | X/10 | 10 | X.XX | [short comment] |
| 2 | Code Quality | X/10 | 8 | X.XX | [short comment] |
| 3 | Security | X/10 | 15 | X.XX | [short comment] |
| 4 | AI/LLM Security | X/10 | 10 | X.XX | [short comment or N/A] |
| 5 | Scalability | X/10 | 10 | X.XX | [short comment] |
| 6 | Resilience | X/10 | 10 | X.XX | [short comment] |
| 7 | Database | X/10 | 8 | X.XX | [short comment] |
| 8 | API/Contracts | X/10 | 6 | X.XX | [short comment] |
| 9 | Frontend/UX | X/10 | 5 | X.XX | [short comment or N/A] |
| 10 | Observability | X/10 | 6 | X.XX | [short comment] |
| 11 | Tests | X/10 | 7 | X.XX | [short comment] |
| 12 | DevOps | X/10 | 3 | X.XX | [short comment] |
| 13 | Compliance | X/10 | 2 | X.XX | [short comment] |

**Final Weighted Score: X.XX / 10**
**Classification: [tier emoji + name]**

---

## 3. Diagnosis by Category

### 3.1 Architecture and System Organization — X/10

**What is good:**
[Specific positive findings with file/pattern references]

**What is bad:**
[Specific negative findings with file/pattern references]

**Risks:**
[What could go wrong because of these issues]

**Recommended fixes:**
[Concrete actions to improve]

### 3.2 Overall Code Quality — X/10

[Same structure as above]

### 3.3 Application Security — X/10

[Same structure as above]

**Vulnerabilities found:**
[List of confirmed vulnerabilities from code analysis]

**Probable vulnerabilities:**
[List of likely vulnerabilities based on patterns observed]

**Could not be confirmed:**
[List of security aspects that couldn't be verified from available code]

### 3.4 AI/LLM/Agents/RAG Security — X/10

[Same structure, or "Not applicable — no relevant AI usage identified."]

### 3.5 Scalability and Performance — X/10

[Same structure]

### 3.6 Resilience and Reliability — X/10

[Same structure]

### 3.7 Database and Data Integrity — X/10

[Same structure]

### 3.8 API and Contracts — X/10

[Same structure]

### 3.9 Frontend / Technical UX — X/10

[Same structure, or "Not applicable — no frontend code found."]

### 3.10 Observability and Operations — X/10

[Same structure]

### 3.11 Tests and Delivery Reliability — X/10

[Same structure]

### 3.12 DevOps / Deploy / Production — X/10

[Same structure]

### 3.13 Compliance, Privacy, and Governance — X/10

[Same structure]

---

## 4. Vulnerabilities and Critical Flaws

### Critical

| Title | Where | Risk | Impact | Recommendation |
|-------|-------|------|--------|----------------|
| [name] | [file:line or pattern] | [what could happen] | [business impact] | [what to do] |

### High

| Title | Where | Risk | Impact | Recommendation |
|-------|-------|------|--------|----------------|
| [name] | [file:line or pattern] | [what could happen] | [business impact] | [what to do] |

### Medium

| Title | Where | Risk | Impact | Recommendation |
|-------|-------|------|--------|----------------|
| [name] | [file:line or pattern] | [what could happen] | [business impact] | [what to do] |

### Low

| Title | Where | Risk | Impact | Recommendation |
|-------|-------|------|--------|----------------|
| [name] | [file:line or pattern] | [what could happen] | [business impact] | [what to do] |

[If no items exist for a severity level, state "None identified."]

---

## 5. Production and Scalability Risks

[For each applicable risk area, explain with specifics:]

**What can break in production:**
[List with concrete scenarios]

**What can fail with increased users:**
[List with concrete scenarios]

**What can cause an incident:**
[List with concrete scenarios]

**What can cause a data leak:**
[List with concrete scenarios]

**What can cause downtime:**
[List with concrete scenarios]

**What can cause operational/financial loss:**
[List with concrete scenarios]

---

## 6. Gaps Preventing a High Score

[List objectively what prevents this system from being:]

**Reliable:** [gaps]
**Secure:** [gaps]
**Scalable:** [gaps]
**Premium-grade:** [gaps]
**Ready for millions of users:** [gaps]

---

## 7. Prioritized Action Plan

### Priority 1 — Block Release 🚫
[Items that MUST be fixed before production deployment]

1. [Action item with specific files/patterns and expected effort]
2. [...]

### Priority 2 — Fix Shortly After Stabilization ⚡
[Important items, not immediate blockers but high priority]

1. [Action item with specific files/patterns and expected effort]
2. [...]

### Priority 3 — Elevate to Premium Grade 🏆
[Architecture, governance, observability, and maturity improvements]

1. [Action item with specific files/patterns and expected effort]
2. [...]

---

## 8. Final Verdict

**[VERDICT EMOJI + TEXT]**

[Explain in no more than 10 lines why this verdict was given. Be direct, honest, and constructive.]

---

*Generated by Code Sentinel v1.0 — Open Source Production Readiness Auditor*
*github.com/[owner]/code-sentinel*
```
