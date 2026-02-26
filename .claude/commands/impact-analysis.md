!`cat docs/DISCOVERY.md`
!`cat docs/PRD.md`

Analyse what the new feature touches in the existing codebase.
Save to docs/IMPACT.md.

Cover:
1. Components Modified — which existing components need to change
2. Components Untouched — which can stay exactly as they are
3. Interface Changes — which interfaces change, and whether changes are breaking or additive
4. Regression Risk — which existing tests are likely to fail from these changes
5. Data Model Changes — any schema, type, or config changes required
6. Hard Constraints — what must NOT change (existing behaviour that must be preserved)
7. Migration Required — any data, config, or dependency migrations needed

Output a risk rating per item: LOW / MEDIUM / HIGH
High risk items must be explicitly addressed in the architecture phase.
