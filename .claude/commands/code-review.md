!`git diff HEAD`
!`find docs/components -name "*.md" 2>/dev/null | xargs cat 2>/dev/null || echo "No component designs found"`

Review the changes shown in the git diff above against the component designs.

Check for:
1. Contract Adherence — does the implementation match the component's public interface spec
2. Error Handling — are all error states from the design handled correctly
3. Type Safety — are inputs and outputs correctly typed
4. Security — any obvious vulnerabilities (injection, unvalidated input, exposed secrets)
5. Test Coverage — do the tests cover happy path, edge cases, and error states
6. Naming — are names clear and consistent with the rest of the codebase
7. Complexity — is any function doing too much (if so, flag for simplifier)

Output:
- PASS or FAIL per check
- For each FAIL: exact file and line, what is wrong, what to do instead
- Overall verdict: READY TO COMMIT or NEEDS CHANGES
