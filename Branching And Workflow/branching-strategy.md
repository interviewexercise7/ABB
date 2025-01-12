# Branching Strategy for Demo Repository

This document outlines the branching strategy for the `demo-branching-prs` repository. It provides guidelines for creating, managing, and merging branches to ensure a streamlined workflow and maintain code quality.

---

## **Branching Overview**

### **Branches**
1. **`main` (Default Branch)**
   - The primary branch that always contains production-ready code.
   - Only approved and thoroughly tested changes are merged here.

2. **`feature/*`**
   - Used for developing new features, bug fixes, or updates.
   - Created for each task or feature based on requirements.

3. **`hotfix/*`**
   - Used for critical fixes that need to be applied to the `main` branch urgently.

4. **`release/*`** *(Optional)*
   - Used for preparing a new release. Includes final testing and documentation updates.

---

## **Workflow**

1. **Creating a Branch**
   - Always branch off from the `main` branch for new work.
   - Use descriptive branch names:
     ```
     feature/add-welcome-message
     feature/update-readme
     hotfix/critical-bug
     ```

   ```bash
   git checkout -b <branch-name>
   ```

2. **Committing Changes**
   - Commit frequently and use clear, concise commit messages:
     ```
     git commit -m "Add welcome message file"
     ```
   - Avoid committing directly to `main`.

3. **Pushing Changes**
   - Push the branch to the remote repository:
     ```bash
     git push origin <branch-name>
     ```

4. **Creating a Pull Request (PR)**
   - Navigate to the repository on GitHub and create a PR.
   - Use a meaningful title and description for the PR.
   - Assign reviewers and link related issues (if applicable).

5. **Code Review**
   - Reviewers check the code for quality, functionality, and adherence to standards.
   - Add comments for improvements or approve the PR.
   - Address comments by pushing additional commits to the branch.

6. **Merging the Pull Request**
   - After approval, merge the PR using the **Squash and Merge** strategy (recommended):
     - Combines all commits into one for a cleaner history.
   - Delete the feature branch after merging.

   ```bash
   git branch -d <branch-name>
   git push origin --delete <branch-name>
   ```

---

## **Guidelines and Best Practices**

1. **Branch Naming Conventions**
   - Use prefixes like `feature/`, `hotfix/`, or `release/` for clarity.
   - Use kebab-case for branch names (e.g., `feature/add-login-page`).

2. **Frequent Pull Requests**
   - Submit small, focused PRs to make the review process faster and more effective.

3. **Code Reviews**
   - Always request a review before merging.
   - Follow GitHub's `Reviewers` feature to assign team members.

4. **Testing**
   - Ensure all changes are tested locally before creating a PR.
   - Incorporate automated tests (if available).

5. **Conflict Resolution**
   - Rebase your branch on `main` to resolve conflicts before merging:
     ```bash
     git fetch origin
     git rebase origin/main
     ```

---

## **Diagram of Branching Strategy**

```text
main
  |\
  | \
  |  feature/add-welcome-message
  |   |--- Pull Request ---> Merge (main)
  |  \
  |   \--- feature/another-feature
  |        |--- Pull Request ---> Merge (main)
  |
  hotfix/critical-bug
   |--- Pull Request ---> Merge (main)
```

---

By following this branching strategy, the `demo-branching-prs` repository will maintain a clear and consistent development workflow, enabling effective collaboration and high code quality.

