# School-facing portal — architecture memo

**Ticket:** CAN-57 · **Parent:** CAN-54  
**Status:** decision draft for board / implementation planning

## 1. Product goals

- **Primary:** Give schools a **single, trustworthy place** to access kit materials, updates, and light coordination—**without replacing** the offline PDF track that must keep shipping with physical kits.
- **Secondary:** Reduce support load (fewer “which version?” questions) via clear versioning and a canonical “current kit” pointer.
- **Non-goals (for early phases):** Full LMS gradebook, deep personalization, or replacing email/ENT workflows schools already use.

## 2. User roles (high level)

| Role | Needs | Portal implications |
|------|--------|---------------------|
| **Direction** | Compliance, procurement traceability, stable URLs for inspectors | Read-heavy, audit-friendly logs, clear legal/privacy pages |
| **Enseignant** | Lesson-ready docs, quick “what changed”, minimal friction | Fast doc discovery, mobile-friendly reading, optional accounts |
| **FabLab / tech** | Files, BOM errata, firmware links, troubleshooting | Download area, versioned assets, link-out to GitHub/releases OK |

## 3. Doc hosting vs PDF parity

- **PDF remains the offline contract:** Everything essential for running the kit in a disconnected classroom stays in the built PDFs (parent track: CAN-54).
- **Portal adds online value:** Search/navigation, **delta pages** (“what changed since vX”), optional richer media (short videos hosted externally), and **canonical download** of the same PDFs the repo builds.
- **Parity rule:** If it is **required to operate the kit**, it must either appear in PDF **or** be linked from PDF with a stable short URL printed in the doc (portal is then a convenience layer, not a hidden dependency).

## 4. Project / “light PM” — MVP vs later

**MVP (aligns with kit delivery, low ceremony)**

- **Published roadmap** (markdown or simple CMS) + **changelog** tied to kit semver.
- **Issue intake:** Contact form or “report a problem” that creates email/ticket (no full school-facing bug DB required on day one).
- **Optional:** Password-protected **staging** area for pilot schools (invite-only).

**Later**

- Role-based spaces (direction vs enseignant views).
- Structured tasks/milestones per school cohort (true PM) if operations scale.
- Deeper ENT / SSO integration (see legal note below).

## 5. Stack options (2–3)

### Option A — Static site + managed auth (recommended default)

**Shape:** Markdown (or MDX) in repo → static generator (e.g. VitePress, Docusaurus, Astro) → host on **Vercel/Netlify/Cloudflare Pages** + **Auth provider** (Clerk, Auth0, or Keycloak if self-host bias).

| Pros | Cons |
|------|------|
| Low run cost, great performance, Git-based workflow matches kit repo | Need discipline for non-technical editors (or pair with a headless CMS) |
| Easy GDPR posture if EU region + DPA with vendor | Custom PM features are “build it yourself” |
| Fast MVP: ship docs in days, add gating later | |

### Option B — OSS “docs + community” platform

**Shape:** **Discourse**, **BookStack**, or similar self-hosted app for docs + forums + light structure.

| Pros | Cons |
|------|------|
| Built-in discussions, notifications, roles | Ops burden: backups, upgrades, hardening |
| Good for pilot feedback loops | Visual/branding fit may need theme work |
| Data stays on infra you control (if self-hosted in EU) | Heavier than static for a pure doc portal |

### Option C — Full LMS / French EdTech suite

**Shape:** Moodle, Open edX, or a commercial school LMS module.

| Pros | Cons |
|------|------|
| Roles, cohorts, quizzes if ever needed | Overkill for “docs + light PM”; long setup |
| Familiar to some IT teams | Licensing/contract complexity, customization cost |

**CTO recommendation:** Start with **Option A** for speed and alignment with the existing markdown → artifact pipeline; revisit **B** if the board wants **school-visible discussion** without building it; defer **C** unless product becomes courseware.

## 6. GDPR / French school context (flag for board / legal)

- **Minors & school accounts:** If login is per-**élève**, expect stricter consent and DPA nuances; **direction/enseignant-only** access simplifies the first phase.
- **ENT / SSO:** Desirable long-term; often implies **official agreements** and identity federation—treat as a **phase 2+** dependency with legal review, not MVP.
- **Hosting:** Prefer **EU region**, subprocessors list, and documented retention for contact-form submissions and access logs.

## 7. Phased roadmap (PDF track is not blocked)

| Phase | Deliverable | PDF track impact |
|-------|-------------|------------------|
| **P0** | Public **marketing + privacy** pages; static listing of current kit PDFs (same files as build output) | None — PDFs unchanged |
| **P1** | Versioned **docs site** from repo; changelog; “download PDF” buttons | PDF remains source of truth; site mirrors |
| **P2** | **Invite-only** area for pilots (auth); structured feedback channel | Optional links printed in PDF once URLs stable |
| **P3** | Role-aware IA; optional PM/cohort features; ENT/SSO if approved | Requires UX + legal sign-off |

## 8. Next steps (if board approves “build”)

- Spawn an **implementation epic** (frontend + infra + content workflow), not scoped in this memo.
- **UX Designer** input: information architecture for the three roles, mobile reading patterns, and how much to expose without login vs behind invite.

---

*Prepared as CTO technical input; not legal advice.*
