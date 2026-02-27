!`cat CLAUDE.md`
!`find . -name "CODING_GUIDELINES*" -o -name "MODULE_STRUCTURE*" -o -name "CONVENTIONS*" | grep -v node_modules | grep -v .git | xargs cat 2>/dev/null || echo "No guideline files found"`

Read the existing codebase. Do not write any code.

Produce docs/DISCOVERY.md covering:
1. Existing Components — what each one does and where it lives
2. Current Data Flow — entry point → processing → output, traced end to end
3. Key Data Models — the main types/schemas the system operates on
4. Patterns and Conventions — naming, error handling, module structure in use
5. Test Coverage — what is tested, what is not, where the gaps are
6. Technical Debt — anything that could complicate adding new features
7. Integration Points — external systems, APIs, or services this codebase touches

This document becomes the foundation for all subsequent phases.
Do not make assumptions — if something is unclear, read more code before concluding.
