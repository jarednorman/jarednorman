---
name: jujutsu
description: Use when working with version control in any repo. If .jj/ exists, this is a Jujutsu repo — use jj commands, not git.
allowed-tools: Bash(jj *)
---

# Jujutsu (jj)

This repo is managed with Jujutsu. Use `jj` commands. Do not use `git` commands for VCS operations — they can corrupt jj state.

## Key facts about this setup

- Default command is `log`, so bare `jj` shows the log
- `bm` is an alias for `bookmark` (e.g. `jj bm create foo`)
- Private commits: any commit whose description starts with `private:` is excluded from pushes
- Diff editor is builtin (no external editor needed)

## Working copy

The working directory is always a commit, referenced as `@`. There is no staging area. Changes are snapshotted automatically on every `jj` command.

There is no need to run `jj commit`.

## Agent rules

Always use `-m` flags to avoid opening an editor:

```bash
jj desc -m "message"     # not: jj desc
jj squash -m "message"   # not: jj squash (opens editor)
```

Avoid interactive commands (`jj split -i`, `jj squash -i`, `jj resolve`) — they will hang.

After any mutation (`squash`, `abandon`, `rebase`, `restore`), verify with `jj st`.

## Workflow

1. Before starting work, run `jj st`. If `@` already has changes, run `jj new` first. If `@` is empty, describe it and use it as-is.
2. Describe your intent: `jj desc -m "Verb object"`
3. Make changes.
4. Do not run `jj new` when done — leave that for the start of the next task.

## Common commands

| Action | Command |
|--------|---------|
| Status | `jj st` |
| Log | `jj log` |
| Diff | `jj diff` |
| Describe commit | `jj desc -m "message"` |
| New commit | `jj new` |
| Edit a commit | `jj edit <change-id>` |
| Show a commit | `jj show <change-id>` |
| Squash into parent | `jj squash` |
| Auto-distribute changes | `jj absorb` |
| Abandon a commit | `jj abandon <change-id>` |
| Undo last operation | `jj undo` |
| Restore files | `jj restore [path]` |
| Create bookmark | `jj bm create <name>` |
| Move bookmark | `jj bm move <name> --to <change-id>` |
| Push bookmark | `jj git push -b <name>` |

## Commit messages

Use an imperative verb phrase in sentence case, no trailing period:

- "Add user authentication"
- "Fix null pointer in payment processor"
- "Remove deprecated API endpoints"

Use `private: ` prefix for commits that should never be pushed:

- `private: WIP notes`
- `private: Local debug logging`

## Identifiers

Prefer **change IDs** over commit IDs — they stay stable when a commit is rewritten. Commit IDs (content hashes) change on every rewrite.

## Bookmarks

Bookmarks are jj's equivalent of git branches. They do not auto-advance when you create new commits — you must move them manually before pushing:

```bash
jj bm move my-feature --to @
jj git push -b my-feature
```

## Conflicts

jj allows committing conflicts. To resolve: edit the conflicted files directly to remove conflict markers, then run `jj st` to confirm resolution. Do not use `jj resolve` (interactive).
