!`cat docs/ARCHITECTURE.md`
!`find docs/components -name "*.md" 2>/dev/null | xargs cat 2>/dev/null`

Use the integration-tester agent to run full integration tests.

After the agent completes:
- Report which component boundaries passed and which failed
- If any existing functionality broke, identify the exact interface mismatch
- Add any failure patterns discovered to CLAUDE.md under Learnings
