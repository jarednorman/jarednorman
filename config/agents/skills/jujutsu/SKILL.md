---
name: jujutsu
description: Use when working with version control in any repo. If .jj/ exists, this is a Jujutsu repo. Use jj commands, not git.
allowed-tools: Bash(jj *)
---

# Jujutsu (jj)

This repo is managed with Jujutsu. Use `jj`, not `git`, for VCS operations in these projects. With Jujutsu, the working directory is always a revision, referenced as `@`. There is no staging area. Changes are snapshotted automatically on every `jj` command.

### Commands

In the commands below, `<revset>` and `<revsets>` accept any revset expression: a change ID, commit ID prefix, bookmark name, or `@`. Where multiple revisions are accepted (`<revsets>`), ranges like `a::b` also work. `<source>` and `<dest>` are revsets too. See `jj help -k revsets` for the full language.

- `jj st`: Show the current repository status.
- `jj log`: Show the revision graph. Note that each node shows both the Jujutsu change ID and the underlying Git commit SHA.
- `jj diff --git -r <revsets>`: Show the diff of a given revision. If `-r` is omitted, `@` is used. Always use `--git` for viewing diffs; Agents frequently read the default `jj` diff format incorrectly.
- `jj show --git -r <revsets>`: Show the message and diff of a given revision. If `-r` is omitted, `@` is used. Always use `--git` for the same reason as `jj diff`.
- `jj desc <revsets> -m "<message>"`: Update the description of a revision. Make sure to use the `-m` flag and specify a message, as otherwise Jujutsu will try to open an editor.
- `jj new`: Create a new child revision after the current revision and move to it. If a revision is specified, instead create the child after that revision.
- `jj edit <revset>`: Make a specific revision the current working copy. After running this command, edits to the repository immediately change the specified revision.
- `jj commit -m "<message>"`: Describe the current revision and move to a new child revision.
- `jj squash --from <source> --into <dest> -m "<message>"`: Squash a specific revision into another specific revision. If `--from` is omitted, `@` is used. If `--into` is omitted, `@` is used. Instead of `--from`/`--into`, `-r` can be used to specify a single revision that will be squashed into its parent. To use the destination message, specify the `-u` flag. Always use `-m` or `-u` to avoid opening an editor.
- `jj absorb`: Automatically distribute changes from the current revision into the closest mutable ancestors where those lines were modified.
- `jj restore <paths> --from <source> --into <dest>`: Copy the file contents from one revision into another. If no paths are specified, restores all the paths. If only `--from` or `--into` is specified, `@` is used for the other. If neither is specified and the revision has a single parent, the paths are restored from `@-` into `@`.
- `jj undo`: Undoes the last operation. Jujutsu can undo nearly any command on the repository itself, including changes to snapshotted files. It cannot undo changes to untracked files, or operations outside the repository like pushes. Use `jj redo` to reapply operations.
- `jj abandon <revsets>`: Abandons a given revision, removing it from the history entirely. It can still be recovered using commands like `jj undo` and `jj op log`.
- `jj op log`: Show the history of operations performed on the repository.
- `jj evolog`: List the previous (Git) commits that the current change has pointed to. This is the history of the current change.
- `jj bookmark create <bookmark-name> -r <revset>`: Create a bookmark with the given name at a specified revision. Bookmarks map to Git branches, but do not move automatically. If `-r` is omitted, the current revision is used.
- `jj bookmark set <bookmark-name> -r <revset>`: Move a bookmark to a specified revision, creating it if it doesn't exist. `@` is used when `-r` is omitted.
- `jj bookmark move <bookmark-name> -t <revset>`: Move a bookmark to a specified revision. `@` is used when `-t` is omitted.
- `jj git push -b <bookmark-name> --remote <remote>`: Push the specified bookmark. If `--remote` is not specified, this falls back to the `git.push` setting, and if that isn't set and there are multiple remotes, then `origin`. You do not normally need to specify `--remote`.
- `jj rebase`: Perform a rebase. It has a variety of flags. One of `-o`, `-A`, or `-B` must be specified. If none of `-b`, `-s`, or `-r` are specified, `-b @` is used.
    - `-r <revsets>`: Specify the revision to be rebased. This can be a range like `ywj::qun`.
    - `-s <revset>`: Specify that a revision and its descendants should be rebased.
    - `-b <revset>`: Specify a whole branch to be rebased.
    - `-o <revset>`: Specify that the revisions should be rebased *onto* the given revision.
    - `-A <revset>`: Specify that the changes are to be inserted *after* the given revision. The changes will be inserted after it and before its children.
    - `-B <revset>`: Specify that the changes are to be inserted *before* the given revision. The changes will be inserted before it and after its parents.

### Workflow

For non-trivial work, use the squash workflow. Create a scratch revision that is separate from the "real" revision you are building up. Use this scratch revision to validate changes before squashing them into the "real" revision.

1. Run `jj st`. If `@` already has changes, run `jj new` first.
2. Describe the target revision: `jj desc -m "Add foo feature"`
3. Create a scratch revision on top: `jj new`
4. Make changes in `@` (the scratch revision).
5. Move finished work into the described parent using `jj squash`.
6. Repeat steps 4-5 until the feature is complete.
7. Leave an empty revision on the top of the stack for future work.

Regularly review the contents of the parent revision with `jj show @-`. Review the current scratch area changes with `jj show @` or `jj st`.

#### Resolving Conflicts

Jujutsu conflicts can live in revisions without blocking your work. Commands like `jj squash` and `jj rebase` may produce conflicts, but the commands will still succeed, leaving the conflicts to be addressed later. Commands like `jj log` and `jj st` will identify conflicted revisions.

To resolve a conflict:

1. Make a new scratch revision off of the conflicted revision. If there are multiple conflicted revisions, start with the earliest one.
2. Use `jj st` to identify the conflicted files.
3. Analyze the conflicted sections, determine the correct resolution (query the user for context if needed), and then edit the conflicted sections to resolve the conflict.
4. Squash the scratch revision into its parent.
5. View the log and confirm that the revision is no longer conflicted.

### Revision Descriptions

Use an imperative verb phrase in sentence case, no trailing period:

- "Add user authentication"
- "Fix null pointer in payment processor"
- "Remove deprecated API endpoints"

Keep the summary line of descriptions under 50 characters. Be terse in the description bodies.

Only include co-authors in revision descriptions that are specifically requested by the user.

### Tips

- Avoid interactive commands (`jj split`, `jj squash -i`, `jj resolve`) as agents cannot interact with them.
- After each operation, verify the result with `jj st` and/or `jj log`.
- Prefer **change IDs** over (Git) commit IDs. Change IDs stay stable when a revision is rewritten. Commit IDs are content hashes (corresponding to git commit hashes) and change on every rewrite.
- Remember that you can move to old mutable commits and add additional changes to them before returning to the tip of the stack in order to address things that were forgotten in previous revisions.
