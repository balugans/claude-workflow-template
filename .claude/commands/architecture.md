!`cat docs/PRD.md`

Based on the PRD above, produce a software architecture document.
Save it to docs/ARCHITECTURE.md.

Include:
1. System Overview — one paragraph, what this system does
2. Components — each component, its single responsibility, and its boundaries
3. Data Flow — how data moves through the system from input to output
4. Tech Stack Decisions — what and why for each major choice
5. Key Interfaces — the contracts between components (inputs, outputs, types)
6. What is NOT in scope for v1 — be explicit
7. Risks — top 3 architectural risks and mitigations

Rules:
- Do not write any implementation code
- If the PRD has ambiguities that affect architecture, ask before proceeding
- Design for the stated constraints, not for imagined future scale
