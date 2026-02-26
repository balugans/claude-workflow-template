!`cat docs/components/$ARGUMENTS.md`

Break this component design into atomic implementation tasks.
Save to docs/tasks/$ARGUMENTS-tasks.md.

For each task include:
- Task ID — e.g. $ARGUMENTS-001, $ARGUMENTS-002
- Description — one sentence, what this task implements
- Acceptance Criteria — specific, testable conditions for done
- Verification Command — the exact command to prove this task works
- Dependencies — which task IDs must be complete before this one

Rules:
- Order tasks by dependency — earlier tasks must not depend on later ones
- First task must always be: create the test scaffolding and fixtures
- Each task must be completable in one TDD cycle (red → green → refactor)
- If a task feels too large, split it
- Do not include tasks outside the scope of this component's design
