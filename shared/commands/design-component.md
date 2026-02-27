!`cat docs/ARCHITECTURE.md`

Design the component: $ARGUMENTS

Save the design to docs/components/$ARGUMENTS.md.

Include:
1. Responsibility — one sentence only
2. Public Interface — all public methods/functions with typed signatures
3. Inputs and Outputs — data types in, data types out
4. Error States — what can go wrong and how it is surfaced
5. Dependencies — which other components this depends on
6. Test Contract — what tests will prove this component works correctly
7. Open Questions — anything that needs a decision before implementing

Rules:
- Do not write implementation code
- If this component's interface conflicts with the architecture, flag it before proceeding
- If $ARGUMENTS is unclear, ask for clarification
