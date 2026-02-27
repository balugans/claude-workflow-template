# Claude Workflow Template

A lean, structured Claude Code workflow for building software from scratch (greenfield) or adding features to existing projects (brownfield). Built around the philosophy of Boris Cherny (creator of Claude Code): vanilla setup, disciplined phases, docs-as-context, and TDD enforced through context isolation.

---

## Why This Exists

When using Claude Code without structure, a few problems emerge:

- Claude loses context mid-task and makes decisions that contradict earlier ones
- TDD gets skipped because Claude defaults to writing implementation first
- Brownfield work breaks existing functionality because there was no collision analysis
- Mistakes repeat across sessions because nothing was written down

This template solves all of that with a simple rule: **each phase gets a fresh context, and docs carry information forward instead**.

---

## How It Works

Every phase writes a document to `docs/`. The next phase reads that document at the start. This means you can run `/clear` between every phase without losing anything — Claude picks up exactly where you left off by reading the docs.

```
Problem statement → PRD → Architecture → Component Designs → Tasks → TDD → Integration
      ↑                                                                           ↑
  (you type this)                                                    (verified end to end)
```

---

## Setup

Clone this repo once. Then run `install.sh` from inside any project you want to set up:

```bash
git clone https://github.com/your-username/claude-template-setup ~/.claude-template
cd /path/to/your-project
bash ~/.claude-template/install.sh
```

The script asks which profile to use, then copies the right commands, agents, and config files into your project.

---

## Profiles

### `se` — Software Engineering

For backend services, APIs, CLIs, and full-stack web projects. Includes the full greenfield/brownfield workflow with TDD agents, architecture commands, and integration testing.

### `ml` — Machine Learning

For data science, model training, and ML pipelines. Includes the same shared base (TDD agents, code review, commit/push/PR) with ML-specific commands layered on top.

Both profiles share a common base from `shared/` — the same TDD agents, code review, and commit workflow apply everywhere.

---

### After setup — two things to customise

**1. `CLAUDE.md`** — fill in your stack, test commands, and module rules. This is the only file that changes between projects. Claude reads it automatically on every session start, so anything you put here applies to every command and agent without repeating it.

**2. `.claude/settings.json`** — add pre-allowed bash commands for your stack so Claude doesn't prompt for permission on routine operations. For example if you use pytest, add `"Bash(pytest:*)"` to the allow list.

Then start Claude Code:

```bash
claude
```

---

## Greenfield Workflow

Use this when starting a project from scratch.

```
# 1. Enter Plan Mode and describe the problem
Shift+Tab (twice) → describe what you are building

# 2. Generate the PRD
/prd
/clear

# 3. Generate the architecture
/architecture
/clear

# 4. Design each component (run in parallel tabs or sequentially)
/design-component "ComponentName"
/clear

# 5. Review all component designs for consistency
/architecture-review
/clear

# 6. Break each component into tasks
/breakdown-tasks "ComponentName"
/clear

# 7. Implement each task with TDD (repeat per task)
> Use tdd-red agent on task <TASK-ID>
/clear
> Use tdd-green agent on task <TASK-ID>
/clear
> Use tdd-refactor agent on task <TASK-ID>
/clear
/code-review
/commit-push-pr
/clear

# 8. Integration test
/integration-test
```

---

## Brownfield Workflow

Use this when adding a feature to an existing codebase. The extra steps at the start ensure Claude understands what already exists before designing anything new.

```
# 1. Enter Plan Mode and describe the new feature
Shift+Tab (twice) → describe the feature

# 2. Discover the existing codebase
/discover
/clear

# 3. Generate the PRD scoped to the new feature
/prd
/clear

# 4. Analyse what the new feature touches in the existing code
/impact-analysis
/clear

# 5. Generate a delta architecture (what changes, not a full rewrite)
/architecture
/clear

# 6. Design each new or modified component
/design-component "ComponentName"
/clear

# 7. Review component designs for consistency
/architecture-review
/clear

# 8. Break each component into tasks
/breakdown-tasks "ComponentName"
/clear

# 9. Implement each task with TDD (repeat per task)
> Use tdd-red agent on task <TASK-ID>
/clear
> Use tdd-green agent on task <TASK-ID>
/clear
> Use tdd-refactor agent on task <TASK-ID>
/clear
/code-review
/commit-push-pr
/clear

# 10. Integration test — verifies old + new together
/integration-test
```

---

## TDD Explained

The three TDD agents run in separate contexts so tests are written before implementation. This is the key insight — if they share a context, Claude writes the implementation first and then writes tests that pass it, defeating the purpose.

**tdd-red** — reads the task spec, writes failing tests against the public interface, confirms they fail. Never writes implementation.

**tdd-green** — reads the failing tests, writes the minimum code to make them pass. No extras, no cleanup.

**tdd-refactor** — reads the passing code, improves it without changing behaviour. Runs tests after every change.

Each agent gets its own `/clear` so it starts fresh with no knowledge of what the previous agent did. The test files on disk are what connect them.

---

## Commands Reference

| Command | Phase | What it does |
|---|---|---|
| `/prd` | Phase 1 | Writes `docs/PRD.md` from your conversation |
| `/architecture` | Phase 2 | Writes `docs/ARCHITECTURE.md` from the PRD |
| `/design-component "Name"` | Phase 3 | Writes `docs/components/Name.md` |
| `/architecture-review` | Phase 4 | Reviews all component designs, writes `docs/ARCHITECTURE_REVIEW.md` |
| `/breakdown-tasks "Name"` | Phase 5 | Writes `docs/tasks/Name-tasks.md` |
| `/code-review` | Per task | Reviews git diff against component spec |
| `/commit-push-pr` | Per task | Tests, commits, pushes, opens PR |
| `/integration-test` | Final | Runs integration-tester agent end to end |
| `/discover` | Brownfield only | Writes `docs/DISCOVERY.md` of existing codebase |
| `/impact-analysis` | Brownfield only | Writes `docs/IMPACT.md` of what the feature touches |

---

## Agents Reference

| Agent | When to use |
|---|---|
| `tdd-red` | Write failing tests for a task |
| `tdd-green` | Make failing tests pass with minimal code |
| `tdd-refactor` | Clean up passing code without changing behaviour |
| `code-simplifier` | Lightweight cleanup pass anytime |
| `integration-tester` | Full system end-to-end test across components |
| `verify-pipeline` | Quick verification suite (tests + typecheck + lint) |

---

## Docs Generated During Workflow

| File | Generated by |
|---|---|
| `docs/PRD.md` | `/prd` |
| `docs/ARCHITECTURE.md` | `/architecture` |
| `docs/components/<Name>.md` | `/design-component` |
| `docs/ARCHITECTURE_REVIEW.md` | `/architecture-review` |
| `docs/tasks/<Name>-tasks.md` | `/breakdown-tasks` |
| `docs/DISCOVERY.md` | `/discover` (brownfield) |
| `docs/IMPACT.md` | `/impact-analysis` (brownfield) |

---

## Key Rules

**`/clear` between every phase.** Docs carry information forward, not context. This keeps each phase focused and prevents earlier decisions from polluting later ones.

**Start non-trivial tasks in Plan Mode.** Press Shift+Tab twice to enter Plan Mode. Iterate on the plan until it looks right, then switch to auto-accept and let Claude execute.

**Update `CLAUDE.md → Learnings` continuously.** Every time Claude makes a mistake, write it down in CLAUDE.md with the fix. This prevents the same mistake from happening in future sessions.

**`/code-review` before every `/commit-push-pr`.** The code review checks the implementation against the component spec. Catching mismatches here is much cheaper than catching them in integration.

**Integration test must verify old functionality (brownfield).** The integration-tester agent is instructed to check that existing behaviour is unchanged. Don't skip this.

---

## Adapting to Your Stack

All commands and agents are written generically. The only domain-specific configuration lives in two places:

- `CLAUDE.md` — your stack, test commands, module rules, and accumulated learnings
- `.claude/settings.json` — pre-allowed bash commands for your tools

Change those two files and the entire workflow works for any stack.