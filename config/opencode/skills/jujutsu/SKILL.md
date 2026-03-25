---
name: jujutsu
description: Use when working with version control in any repo. If .jj/ exists, this is a Jujutsu repo. Use jj commands, not git.
allowed-tools: Bash(jj *)
---

# Jujutsu (jj)

This repo is managed with Jujutsu. Use `jj` commands. Do not use `git` commands for VCS operations; they can corrupt jj state.

## Key facts about this setup

- Default command is `log`, so bare `jj` shows the log
- `bm` is an alias for `bookmark` (e.g. `jj bm create foo`)
- Private revisions: any revision whose description starts with `private:` is excluded from pushes
- Interactive diff editor is builtin (no external editor needed)

## Working copy

The working directory is always a revision, referenced as `@`. There is no staging area. Changes are snapshotted automatically on every `jj` command.

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

### Squash workflow

For non-trivial work, use the squash workflow. It gives you a scratch space (`@`) separate from the "real" revision, similar to git's staging area:

1. Run `jj st`. If `@` already has changes, run `jj new` first.
2. Describe the target revision: `jj desc -m "Add foo feature"`
3. Create a scratch space on top: `jj new`
4. Make changes in `@` (the scratch revision).
5. Move finished work into the described parent: `jj squash`
   - To move only specific files: `jj squash <path>`
6. Repeat steps 4-5 until the feature is complete.
7. Do not run `jj new` when done — leave that for the start of the next task.

Review the contents of the parent revision with `jj show @-`. Review the current "scratch area" changes with `jj show @` or `jj st`. You can update the description of the parent revision with `jj describe @- -m "<message>"`.

### Alternative: edit in place

For simple, single-step changes it is fine to skip the scratch revision:

1. Run `jj st`. If `@` already has changes, run `jj new` first.
2. Describe the revision: `jj desc -m "Fix typo in README"`
3. Make changes directly in `@`.
4. Do not run `jj new` when done — leave that for the start of the next task.

## Common commands

| Action | Command |
|--------|---------|
| Status | `jj st` |
| Log | `jj log` |
| Diff | `jj diff` |
| Describe revision | `jj desc -m "message"` |
| New revision | `jj new` |
| Edit a revision | `jj edit <change-id>` |
| Show a revision | `jj show <change-id>` |
| Squash into parent | `jj squash` |
| Auto-distribute changes | `jj absorb` |
| Abandon a revision | `jj abandon <change-id>` |
| Undo last operation | `jj undo` |
| Restore files | `jj restore [path]` |
| Create bookmark | `jj bm create <name>` |
| Move bookmark | `jj bm move <name> --to <change-id>` |
| Push bookmark | `jj git push -b <name>` |

## Descriptions

Use an imperative verb phrase in sentence case, no trailing period:

- "Add user authentication"
- "Fix null pointer in payment processor"
- "Remove deprecated API endpoints"

Use `private: ` prefix for revisions that should never be pushed:

- `private: WIP notes`
- `private: Local debug logging`

## Squashing

`jj squash` moves changes from `@` into its parent — this is the core mechanic of the squash workflow above.

- Move all changes into parent: `jj squash`
- Move specific files only: `jj squash <path>`
- Squash into an arbitrary revision: `jj squash --into <change-id>`
- Move between two arbitrary revisions: `jj squash --from <source> --into <dest>`

Always pass `-m "message"` if squashing would leave the parent with no description, to avoid opening an editor.

## Identifiers

Prefer **change IDs** over revision IDs — change IDs stay stable when a revision is rewritten. Revision IDs are content hashes (corresponding to git commit hashes) and change on every rewrite.

## Bookmarks

Bookmarks are jj's equivalent of git branches. They do not auto-advance when you create new revisions — you must move them manually before pushing:

```bash
jj bm move my-feature --to @
jj git push -b my-feature
```

## Conflicts

jj allows conflicts in revisions. To resolve: edit the conflicted files directly to remove conflict markers, then run `jj st` to confirm resolution. Do not use `jj resolve` (interactive).
