!`git status --short`
!`git diff --stat`
!`git branch --show-current`

Review the above. Then:

1. Run the full test suite and confirm it passes before committing
2. Stage all changes
3. Write a descriptive commit message in this format:
   <type>(<scope>): <what changed and why>
   Types: feat, fix, test, refactor, docs, chore
4. Push to the current branch
5. Open a pull request using: gh pr create --fill

If tests fail, stop and report which tests failed. Do not commit.
