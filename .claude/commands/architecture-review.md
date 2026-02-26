!`cat docs/ARCHITECTURE.md`
!`find docs/components -name "*.md" 2>/dev/null | xargs cat 2>/dev/null || echo "No component designs found"`

Review all component designs against the architecture document.
Save the review to docs/ARCHITECTURE_REVIEW.md.

Check for:
1. Circular Dependencies — does any component depend on another that depends back on it
2. Interface Mismatches — does component A's output match component B's expected input
3. Missing Components — does the architecture mention anything not yet designed
4. Responsibility Overlap — do any two components do the same thing
5. Boundary Violations — does any component reach into another's internals
6. Untested Contracts — are there interfaces with no test coverage planned
7. Scope Creep — does any component design exceed what the PRD requires

Output:
- PASS or FAIL for each check
- For each FAIL: which components are affected and what must change before proceeding
- Overall verdict: READY TO BREAK DOWN INTO TASKS or NEEDS REVISION
