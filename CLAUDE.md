# Project Context

## Stack
<!-- TODO: Fill in your tech stack -->
- Backend:
- Frontend:
- Database:
- Testing:

## Architecture Rules
<!-- TODO: Add constraints that Claude must always respect -->
- Never modify shared interfaces without updating all consumers
- All new modules must have a corresponding test file
- Follow the module structure defined in docs/MODULE_STRUCTURE.md (if present)

## Project Knowledge Files
<!-- Claude reads these before every task -->
- CLAUDE.md (this file)
- docs/CODING_GUIDELINES.md (if present)
- docs/ARCHITECTURE.md (once generated)
- docs/MODULE_STRUCTURE.md (if present)

## Module Addition Rules
<!-- TODO: Describe where new modules go and what structure they follow -->
- New modules go in: src/
- Each module requires: implementation file, test file
- Follow existing module patterns as reference

## Verification Commands
<!-- TODO: Replace with your actual commands -->
- Run tests: <your test command>
- Type check: <your typecheck command>
- Lint: <your lint command>
- Validate config: <your config validation command>

## Learnings
<!-- Update this continuously as Claude makes mistakes -->
<!-- Format: [date] what went wrong → what to do instead -->
