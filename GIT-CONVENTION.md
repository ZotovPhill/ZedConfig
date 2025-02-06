# Git Conventions

This document defines guidelines for working with Git in this project. Adhering to these standards helps maintain clarity in commit history, facilitates collaboration, and streamlines development.

## Table of Contents
1. [Branch Naming](#branch-naming)
2. [Commit Message Format](#commit-message-format)
3. [Pull Requests and Merge Policy](#pull-requests-and-merge-policy)
4. [Tagging and Releases](#tagging-and-releases)
5. [Examples](#examples)
6. [References](#references)

---

## Branch Naming

Use a clear, descriptive branch naming convention to indicate the type and purpose of a branch:

• feature/<short-description>
• fix/<short-description>
• hotfix/<short-description>
• chore/<short-description>
• docs/<short-description>

Examples:
• feature/add-user-auth
• fix/login-page-error
• chore/update-dependencies
• docs/improve-readme

Guidelines:
1. Keep branch names concise, using lowercase letters and dashes (-) for spaces.
2. Optional: Include an issue tracking ID if your project uses GitHub Issues, Jira, or similar, e.g., feature/123-add-user-auth.

---

## Commit Message Format

Use [Conventional Commits](https://www.conventionalcommits.org/) or a similar style to ensure your commit history is standardized and machine-readable.

### Message Structure

A commit message should contain a header, an optional body, and an optional footer:

┌─────────────────────────────────────────────────────────┐
│ <type>(scope?): <short-summary>                       │
│                                                       │
│ [optional body]                                       │
│                                                       │
│ [optional footer(s)]                                  │
└─────────────────────────────────────────────────────────┘

1. **Header** (required): Contains the commit type, an optional scope, and a short summary.
2. **Body** (optional): Explains what was changed and why.
3. **Footer** (optional): Adds issue references, breaking changes, or additional notes.

### Commit Types

• **feat**: A new feature.
• **fix**: A bug fix.
• **docs**: Documentation-only changes.
• **style**: Changes that do not affect code meaning (formatting, missing semicolons, etc.).
• **refactor**: A code change that neither fixes a bug nor adds a feature.
• **perf**: A code change that improves performance.
• **test**: Adding or correcting tests.
• **chore**: Changes to the build process or auxiliary tools (no production code changes).

### Scope

Optional indication of the impacted area of the application (e.g., “auth,” “ui,” “backend”).

### Summary

1. Keep it brief (50 characters or less).
2. Use sentence case; do not capitalize the first letter unless it’s a proper noun.
3. Do not end with a period.

### Body

1. Explain the what and why (but not necessarily the how).
2. Wrap text at 72 characters for readability if your team follows that convention.
3. Use bullet points or paragraphs as needed.

### Footer

1. References to issues (e.g., “Closes #123”).
2. Outline breaking changes (e.g., “BREAKING CHANGE: description”).

---

## Pull Requests and Merge Policy

1. **Pull Request Title**: Match or summarize the commit convention if possible (e.g., feat: add user authentication).
2. **Pull Request Description**: Provide context, screenshots (if UI-related), or references to tasks/issues.
3. **Code Reviews**:
   • At least one reviewer must approve the PR before merging.
   • Ensure all checks (tests, linters) pass.
4. **Merge Strategy**:
   • Use squash merges to keep commit history clean and reduce noise.
   • For hotfixes or urgent patches, rebase can be used when a linear history is required.
5. **Automatic Checks**:
   • The PR should pass the CI/CD pipeline (if applicable) before merging.

---

## Tagging and Releases

Use Git tags to mark release versions in your repository. The recommended approach is to follow [Semantic Versioning](https://semver.org/) (e.g., v1.2.3):

1. **MAJOR** version when you make incompatible API changes.
2. **MINOR** version when you add functionality in a backward-compatible manner.
3. **PATCH** version when you make backward-compatible bug fixes.

Examples:
• v1.0.0 -> Official first release.
• v1.1.0 -> Adds new features, maintains backward compatibility.
• v1.1.1 -> Small bug fix or patch.

---

## Examples

Here are some sample commit messages:

1) feat(auth): add JWT-based authentication
• Introduces a new JWT-based auth flow.
• Allows users to log in with JSON Web Tokens.
• Closes #42.

2) fix(ui): patch login form validation
• Corrects an error where users could submit an empty form.
• Body text describing approach and why it was needed.
• Closes #123.

3) docs: update README to reflect new commands
• Adds examples for installation.
• Updates usage instructions.

4) chore(deps): upgrade typescript to v4.8
• Regular dependency maintenance.

---

## References

Below are useful links if you wish to adopt or refine these guidelines:

• [Conventional Commits](https://www.conventionalcommits.org/)
• [Git Branching Models - Atlassian](https://www.atlassian.com/git/tutorials/comparing-workflows)
• [Semantic Versioning](https://semver.org/)
