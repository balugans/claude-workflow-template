# Workflow Reference

Quick reference for the full development workflow using this template.

---

## Setup (once per project)

1. Fill in `CLAUDE.md` — stack, test commands, module rules
2. Update `settings.json` — add pre-allowed bash commands for your stack
3. Start Claude Code in your project root: `claude`

---

## Greenfield Project

```
Plan Mode (Shift+Tab twice) → describe the problem

/prd
/clear

/architecture
/clear

/design-component "<ComponentName>"     ← repeat per component
/clear

/architecture-review
/clear

/breakdown-tasks "<ComponentName>"      ← repeat per component
/clear

# Per task — repeat until all tasks done:
> Use tdd-red agent on task <TASK-ID>
/clear
> Use tdd-green agent on task <TASK-ID>
/clear
> Use tdd-refactor agent on task <TASK-ID>
/clear
/code-review
/commit-push-pr
/clear

/integration-test
```

---

## Brownfield Project (adding a feature to existing codebase)

```
Plan Mode (Shift+Tab twice) → describe the new feature

/discover
/clear

/prd
/clear

/impact-analysis
/clear

/architecture
/clear

/design-component "<ComponentName>"     ← repeat per component
/clear

/architecture-review
/clear

/breakdown-tasks "<ComponentName>"      ← repeat per component
/clear

# Per task — repeat until all tasks done:
> Use tdd-red agent on task <TASK-ID>
/clear
> Use tdd-green agent on task <TASK-ID>
/clear
> Use tdd-refactor agent on task <TASK-ID>
/clear
/code-review
/commit-push-pr
/clear

/integration-test                       ← verifies old + new together
```

---

## Docs Generated During Workflow

| Phase | Output |
|---|---|
| /prd | docs/PRD.md |
| /architecture | docs/ARCHITECTURE.md |
| /design-component | docs/components/<n>.md |
| /architecture-review | docs/ARCHITECTURE_REVIEW.md |
| /breakdown-tasks | docs/tasks/<n>-tasks.md |
| /discover | docs/DISCOVERY.md |
| /impact-analysis | docs/IMPACT.md |

---

## Available Agents

| Agent | When to use |
|---|---|
| tdd-red | Write failing tests for a task |
| tdd-green | Make failing tests pass |
| tdd-refactor | Clean up passing code |
| code-simplifier | Lightweight cleanup anytime |
| integration-tester | Full system end-to-end test |
| verify-pipeline | Quick verification suite |

---

## Key Rules

- `/clear` between every phase — docs carry information forward, not context
- Always run in Plan Mode for non-trivial tasks (Shift+Tab twice)
- Update `CLAUDE.md → Learnings` whenever Claude makes a mistake
- `/code-review` before every `/commit-push-pr`
- Integration test must verify old functionality still works (brownfield)
