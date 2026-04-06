# Code Sentinel — Analysis Categories & Checklists

This file contains the detailed checklist for each of the 13 analysis categories.
For each category, examine the relevant code and check every item listed.

---

## 1. Architecture and System Organization

Evaluate how the system is structured and whether it can evolve over time.

Check for:
- Separation of concerns — are business logic, data access, and presentation in distinct layers?
- Modularization — are features organized into cohesive modules or scattered randomly?
- Cohesion and coupling — do modules depend on each other excessively?
- Layer clarity — can you identify clear boundaries between layers?
- Thin vs. bloated controllers — are controllers/handlers doing too much business logic?
- Well-defined services — is business logic extracted into reusable service layers?
- Organized repositories / data access — is database access centralized or scattered?
- Well-represented domain — does the code model the domain clearly?
- Excessive scattered logic — is the same type of logic (validation, auth, formatting) spread everywhere?
- Circular dependencies — do modules reference each other in loops?
- Improvised architecture — does the structure look planned or accidental?
- Difficulty of evolution — how hard would it be to add a major new feature?
- Presence of anti-patterns — God objects, anemic domain models, spaghetti code, etc.
- Maintainability by a real team — could a new developer onboard in reasonable time?

Score 0–10.

---

## 2. Overall Code Quality

Evaluate the day-to-day readability and maintainability of the code itself.

Check for:
- Readability — can you understand what code does without excessive effort?
- Consistency — are naming conventions, formatting, and patterns uniform?
- Poor or ambiguous naming — variables like `data`, `temp`, `x`, `result` in complex contexts
- Duplication — copy-pasted logic that should be extracted
- Oversized functions — functions doing too many things (>40–50 lines is a yellow flag)
- Bloated classes/modules — files with 500+ lines of mixed responsibilities
- Apparent cyclomatic complexity — deeply nested conditionals, long switch statements
- Comments — unnecessary noise vs. missing explanations for non-obvious logic
- Clarity of intent — does the code communicate its purpose?
- Dead code — unreachable code, unused imports, commented-out blocks
- Hacks — workarounds with TODO/FIXME/HACK markers
- Dangerous TODOs — `// TODO: add validation here` in security-critical paths
- Fragile logic — code that breaks with minor input changes
- Edge case handling — are boundaries, nulls, empty collections, and error states handled?

Score 0–10.

---

## 3. Application Security

This is the most critical category. Evaluate thoroughly.

Check for:
- **Authentication**: How are users identified? JWT? Sessions? OAuth? Is it implemented correctly?
- **Authorization**: Are permissions checked on every protected endpoint? Is it per-resource?
- **Roles and permissions**: RBAC/ABAC implementation quality
- **Backend validation**: Is all user input validated server-side (not just frontend)?
- **Privilege escalation**: Can a regular user access admin functionality?
- **Tenant segregation**: In multi-tenant systems, can one tenant access another's data?
- **IDOR / BOLA**: Can users access resources by guessing/incrementing IDs?
- **Injection attacks**: SQL injection, NoSQL injection, command injection, template injection, path traversal
- **XSS**: Are outputs properly escaped/sanitized?
- **CSRF**: Are state-changing operations protected against cross-site request forgery?
- **SSRF**: Can user input cause the server to make requests to internal resources?
- **Open redirect**: Can URL parameters redirect users to malicious sites?
- **Mass assignment**: Can users set fields they shouldn't (admin flags, prices, etc.)?
- **Insecure deserialization**: Is untrusted data deserialized without validation?
- **File uploads**: Are uploaded files validated for type, size, and content?
- **Rate limiting**: Are expensive or sensitive endpoints protected against abuse?
- **Hardcoded secrets**: API keys, passwords, tokens in source code
- **Token exposure**: Tokens in URLs, logs, or client-visible responses
- **Log leakage**: PII, tokens, or passwords appearing in logs
- **Encryption**: Is data encrypted at rest and in transit? What algorithms?
- **Password hashing**: bcrypt/scrypt/argon2 or plain text/MD5/SHA1?
- **Session management**: Proper expiration, rotation, invalidation?
- **Security headers**: CSP, HSTS, X-Frame-Options, etc.
- **CORS**: Is the CORS policy restrictive or wide open?
- **Dependencies**: Known vulnerabilities in dependencies?
- **Admin endpoints**: Are administrative routes properly protected?
- **Audit trail**: Are security-relevant actions logged?

At the end of this category, compile three lists:
1. Vulnerabilities found (confirmed from code)
2. Probable vulnerabilities (strong evidence but not 100% confirmed)
3. Checks that could not be confirmed (insufficient evidence in codebase)

Score 0–10.

---

## 4. AI / LLM / Agents / RAG Security

Only evaluate this if the system uses AI/LLM features. Otherwise state "Not applicable."

Check for:
- **Prompt injection**: Can user input manipulate system prompts?
- **Indirect prompt injection**: Can external data (documents, emails) inject instructions?
- **Jailbreak risk**: Can users bypass model safety guardrails?
- **System prompt exposure**: Can users extract the system prompt?
- **Context leakage**: Does the model receive data from other users/tenants?
- **Memory/knowledge leakage**: Can conversation history leak between users?
- **Tool abuse**: Can the model be tricked into misusing tools (file access, API calls)?
- **Insecure tool execution**: Are tool outputs validated before being acted upon?
- **Model output validation**: Are model responses validated before being shown/stored?
- **Policy layer**: Is there a content moderation or safety layer?
- **Guardrails**: Are there limits on what the model can do?
- **Instruction/input separation**: Are trusted instructions separated from user input?
- **Document ingestion security**: Are ingested documents sanitized?
- **RAG filtering**: Is retrieved context filtered for relevance and authorization?
- **Sensitive data in context**: Does the model receive more data than it needs?
- **Prompt privileges**: Do prompts have access to more resources than necessary?
- **Data exfiltration**: Could the model be used to extract sensitive data?
- **Multi-tenant context isolation**: Is context properly scoped per user/tenant?
- **Destructive actions**: Do dangerous operations require human confirmation?
- **Per-user scoping**: Are agent capabilities properly scoped to the requesting user?
- **Operational limits**: Are there limits on tokens, calls, or actions per session?

Score 0–10.

---

## 5. Scalability and Performance

Evaluate whether the system can handle growth.

Check for:
- Obvious bottlenecks — single points of contention
- N+1 queries — loading related data in loops instead of joins/eager loading
- Heavy queries — full table scans, unindexed filters, complex aggregations on every request
- Lack of pagination — endpoints that return unbounded result sets
- Lack of caching — frequently-accessed, rarely-changed data fetched fresh every time
- Missing async processing — synchronous execution of tasks that should be queued
- Concurrency issues — shared mutable state without proper synchronization
- Lock contention — database or application-level locks that could become bottlenecks
- Race conditions — time-of-check-to-time-of-use bugs
- Redundant calls — calling the same API/database multiple times for the same data
- Missing debounce/throttle — rapid-fire user actions causing excessive processing
- Memory concerns — loading large datasets into memory, unbounded caches
- CPU concerns — expensive computation in the request path
- Upload/download handling — large files processed synchronously without streaming
- Missing timeouts — external calls that could hang indefinitely
- Missing retries with backoff — transient failures causing hard errors
- Missing circuit breaker — cascading failures when a dependency goes down
- Horizontal scaling readiness — local file storage, in-memory sessions, sticky state
- Local state dependence — anything that prevents running multiple instances

Score 0–10.

---

## 6. Resilience and Reliability

Evaluate how the system behaves when things go wrong.

Check for:
- Error handling quality — are errors caught, logged, and handled appropriately?
- Silent failures — catch blocks that swallow exceptions without logging or re-throwing
- Dangerous retries — retries without idempotency, backoff, or limits
- Cascading failures — one component failure bringing down the entire system
- Lack of fallback — no degraded mode when a dependency is unavailable
- Idempotency — can operations be safely retried without side effects?
- Duplicate protection — is there protection against processing the same request twice?
- Transaction management — are multi-step operations wrapped in proper transactions?
- Database/system consistency — can the system end up in an inconsistent state?
- Data corruption risk — concurrent writes without proper locking
- Reprocessing safety — what happens if a job/message is processed twice?
- Partial failure behavior — how does the system handle partial success in multi-step operations?
- Message/event loss — can messages be lost in transit without detection?
- Production robustness — overall confidence that the system won't break under real conditions

Score 0–10.

---

## 7. Database and Data Integrity

Evaluate the data layer quality.

Check for:
- Data modeling quality — does the schema represent the domain well?
- Constraints — NOT NULL, UNIQUE, CHECK constraints where appropriate
- Indexes — are frequently-queried columns indexed?
- Referential integrity — foreign keys enforced at the database level
- Migrations — are schema changes managed through migration files?
- Inconsistency risk — can the database end up in a state the application doesn't expect?
- Orphaned data — can deleting a parent leave orphaned child records?
- Normalization — appropriate level of normalization (not too much, not too little)
- Insecure queries — string concatenation instead of parameterized queries
- Transaction usage — are related writes grouped in transactions?
- Soft delete implementation — if used, is it consistent and properly filtered?
- Multi-tenant strategy — how is tenant data isolated (row-level, schema-level, database-level)?
- Data retention — is there a strategy for archiving or deleting old data?
- Secure deletion — when data is deleted, is it really gone?
- Audit trail — are changes to sensitive data tracked?

Score 0–10.

---

## 8. API and Contracts

Evaluate the quality of the system's interfaces.

Check for:
- Route consistency — consistent URL patterns and naming conventions
- REST/GraphQL standards — proper use of HTTP methods, status codes, query patterns
- Versioning — is there an API versioning strategy?
- Clear contracts — are request/response shapes well-defined?
- HTTP status codes — are they used correctly (not everything returning 200)?
- Consistent payloads — uniform response structure across endpoints
- Input validation — are inputs validated with clear error messages?
- Consistent error handling — uniform error response format
- Predictable messages — clear, actionable error messages
- Evolutionary compatibility — can the API evolve without breaking clients?
- Documentation — is there API documentation (Swagger/OpenAPI, etc.)?

Score 0–10.

---

## 9. Frontend / Technical UX

Only evaluate if there is a frontend. Otherwise state "Not applicable."

Check for:
- Frontend security — XSS prevention, input sanitization
- Insecure token storage — tokens in localStorage vs. httpOnly cookies
- Improper data exposure — sensitive data in client-side state or network responses
- Loading/error state handling — are loading spinners, error messages, and empty states handled?
- Basic accessibility — semantic HTML, ARIA labels, keyboard navigation
- Render performance — unnecessary re-renders, large bundles, unoptimized images
- Component organization — clear component hierarchy and reuse
- Backend coupling — frontend tightly coupled to backend implementation details
- Logic duplication — business logic duplicated between frontend and backend
- State management — appropriate complexity of state management solution
- Fragile UX in critical flows — checkout, onboarding, authentication
- Visual-only route protection — routes hidden in UI but accessible by URL
- Missing backend authorization — relying on frontend to enforce permissions

Score 0–10.

---

## 10. Observability and Operations

Evaluate whether the team can understand what's happening in production.

Check for:
- Structured logs — JSON or structured format vs. unstructured text
- Useful logs — do logs contain enough context to diagnose issues?
- Sensitive data in logs — PII, tokens, passwords appearing in log output
- Metrics — are key business and technical metrics tracked?
- Tracing — distributed tracing for request flows across services
- Monitoring — dashboards or alerting for key indicators
- Alerts — proactive notification of problems
- Health checks — endpoints to verify system health
- Readiness/liveness probes — for container orchestration
- Request correlation — can you trace a request across components?
- Auditing — are user actions logged for compliance?
- Failure visibility — how quickly would the team know something is broken?
- Incident response support — are there runbooks, error codes, or diagnostic tools?

Score 0–10.

---

## 11. Tests and Delivery Reliability

Evaluate test coverage and quality.

Check for:
- Unit tests — do they exist? Do they test meaningful behavior?
- Integration tests — do they test component interactions?
- E2E tests — do they cover critical user journeys?
- Meaningful coverage — tests that verify behavior, not just execute code
- Authorization tests — are permission checks tested?
- Security tests — are security controls verified by tests?
- Regression tests — do tests prevent known bugs from recurring?
- Load tests — has the system been tested under load?
- Critical flow tests — are the most important user flows well-tested?
- Test quality — do tests break when behavior changes, not just when implementation changes?
- CI/CD reliability — can the team deploy with confidence?

Score 0–10.

---

## 12. DevOps / Deploy / Production

Evaluate deployment and operational maturity.

Check for:
- CI/CD pipeline — automated build, test, deploy?
- Pipeline quality — comprehensive checks or just basic build?
- Pre-deploy validations — linting, type checking, security scanning?
- Environment management — clear dev/staging/prod separation
- Secrets management — are secrets stored securely (vault, env vars) or hardcoded?
- Rollback capability — can a bad deploy be quickly reversed?
- Safe migrations — can database migrations run without downtime?
- Zero-downtime deploy — rolling deploys, blue-green, canary?
- Insecure configurations — debug mode in production, verbose errors exposed
- Infrastructure as code — Terraform, Pulumi, CloudFormation, etc.?
- Real production readiness — overall confidence the deploy process won't cause incidents

Score 0–10.

---

## 13. Compliance, Privacy, and Governance

Evaluate data governance and regulatory readiness.

Check for:
- PII exposure — is personally identifiable information properly protected?
- Data minimization — does the system collect only what it needs?
- Consent management — is user consent collected and respected?
- Audit trail — are data access and changes tracked?
- Retention and deletion — can user data be deleted on request (right to erasure)?
- Administrative privileges — are admin capabilities properly controlled?
- LGPD/GDPR concerns — are there apparent compliance gaps?
- Sensitive data access — who can access what, and is it logged?
- Client/tenant segregation — is customer data properly isolated?
- Operational governance — are there processes for change management, incident response?

Score 0–10.
