# 🛡️ Code Sentinel

**Production-grade code quality analysis and audit report generator.**

Code Sentinel is an open-source skill for AI coding agents (Claude Code, Codex, Cursor, etc.) that performs a deep, multi-dimensional review of any codebase and generates a structured markdown report with scores, vulnerabilities, risks, and a prioritized action plan.

## What It Does

Code Sentinel analyzes your project across **13 dimensions**:

1. **Architecture & System Organization** — separation of concerns, modularity, coupling
2. **Code Quality** — readability, consistency, complexity, dead code
3. **Application Security** — auth, injection, IDOR, XSS, CSRF, secrets, encryption
4. **AI/LLM Security** — prompt injection, context leakage, tool abuse, guardrails
5. **Scalability & Performance** — N+1 queries, caching, async, bottlenecks
6. **Resilience & Reliability** — error handling, idempotency, cascading failures
7. **Database & Data Integrity** — modeling, constraints, migrations, transactions
8. **API & Contracts** — REST standards, versioning, validation, documentation
9. **Frontend / Technical UX** — XSS, token storage, state management, accessibility
10. **Observability & Operations** — logging, metrics, tracing, health checks
11. **Tests & Delivery Reliability** — unit, integration, e2e, CI/CD confidence
12. **DevOps / Deploy / Production** — pipelines, secrets, rollback, zero-downtime
13. **Compliance, Privacy & Governance** — PII, GDPR/LGPD, audit trails, retention

Each category gets a **0–10 score** with weighted calculation, producing a final classification from "Critical" to "Excellent / Premium Grade."

## Output

A comprehensive markdown report containing:

- **Executive Summary** — maturity level, production readiness, business risks
- **Weighted Score Table** — all 13 categories with scores, weights, and comments
- **Detailed Diagnosis** — per-category good/bad/risks/fixes
- **Vulnerability List** — Critical/High/Medium/Low with locations and fixes
- **Production Risks** — what can break, leak, or cause incidents
- **Gap Analysis** — what prevents a higher score
- **Prioritized Action Plan** — 3 tiers (block release / fix soon / premium grade)
- **Final Verdict** — FAILED / APPROVED WITH CAVEATS / GOOD / STRONG

## Installation

### As a Claude Code Skill

Copy the `code-sentinel/` folder to your Claude Code skills directory:

```bash
# Global installation
cp -r code-sentinel/ ~/.claude/skills/code-sentinel/

# Per-project installation
cp -r code-sentinel/ .claude/skills/code-sentinel/
```

### As a Cowork Plugin Skill

Place it in your Cowork skills directory and it will be available in Cowork sessions.

### With Any AI Agent

The `SKILL.md` and `references/` files contain all the instructions and checklists.
You can adapt them as a system prompt for any AI agent (Codex, Cursor, Windsurf, etc.)
by concatenating the files into a single prompt.

## Usage

Once installed, simply ask your AI agent:

- "Review this codebase"
- "Is this project ready for production?"
- "Run a code quality audit"
- "Generate a security assessment"
- "How good is this code?"
- "Check this project's technical health"

Code Sentinel will explore the codebase, analyze all 13 categories, and generate a
`code-sentinel-report.md` file with the complete audit.

## Language Support

Code Sentinel is **language-agnostic**. It works with any programming language and
framework by analyzing patterns, architecture, and conventions rather than relying
on language-specific tooling.

## Philosophy

Code Sentinel adopts the mindset of a senior engineering team performing a production
readiness review. It does not assume something is correct just because it works. It
does not praise without technical justification. It looks for hidden flaws, architectural
risks, operational risks, security issues, maintenance fragility, and technical debt.

The goal is to answer: *"Is this system truly ready for serious production?"*

## Contributing

Contributions are welcome! Areas where help is needed:

- Additional language-specific checklists
- Integration with static analysis tools
- CI/CD pipeline integration
- Additional report formats (HTML, PDF)
- Translations

## License

MIT License — see [LICENSE](LICENSE) for details.
