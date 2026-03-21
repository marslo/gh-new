# gh-new

> A [GitHub CLI](https://cli.github.com/) extension for smartly creating Pull Requests with an interactive base branch picker powered by [fzf](https://github.com/junegunn/fzf).

---

## features

- **Interactive base branch selection** — picks from remote branches sorted by most recent commit, with a live `git show` preview
- **Auto-push** — detects if the current branch hasn't been pushed (or is behind remote) and pushes it before creating the PR
- **Auto-title & body** — pre-fills from the latest commit message
- **`auto-merge` label** — automatically applied if the label exists in the repo
- **Label management** — add multiple labels via comma-separated values or repeated flags
- **Draft support** — create the PR as a draft
- **Pass-through** — forward any extra flags directly to `gh pr create`

---

## requirements

| TOOL                                   | VERSION |
|----------------------------------------|---------|
| [gh](https://cli.github.com/)          | ≥ 2.36  |
| [fzf](https://github.com/junegunn/fzf) | ≥ 0.60  |
| bash                                   | ≥ 4.0   |

---

## installation

```bash
gh extension install marslo/gh-new
```

## setup (submodules + bash completion)

```bash
gh new --setup
```

```bash
# `--force` re-install
gh new --setup --force
```

## bash completion

`--setup` prints the two lines you need to add to `~/.bashrc` (order matters):

```bash
# 1. gh native completion must be sourced first
eval "$(gh completion -s bash)"
# or: source ~/.marslo/bash_completion.d/gh.bash.sh

# 2. gh-new completion wraps __start_gh — must come after
source "${BASH_COMPLETION_USER_DIR:-${HOME}/.local/share/bash-completion}/gh-ext.bash.sh"
```

---

## usage

```
gh new [OPTIONS]
```

### options

| FLAG                  | DESCRIPTION                                                                                       |
|-----------------------|---------------------------------------------------------------------------------------------------|
| `-o`, `--open`        | Open the created PR in the browser                                                                |
| `-l`, `--label LABEL` | Add label(s) — comma-separated or repeated; `auto-merge` is auto-applied if it exists in the repo |
| `-v`, `--verbose`     | Show verbose output                                                                               |
| `-a`, `--auto`        | If a PR already exists for the current branch, open it instead of creating a new one              |
| `-d`, `--draft`       | Create the PR as a draft                                                                          |
| `-D`, `--dryrun`      | Print the command without executing it                                                            |
| `-h`, `--help`        | Show help                                                                                         |
| `--` `GH_OPTS`        | Pass remaining args to `gh pr create` (e.g. `--web`, `--reviewer`)                                |

---

## examples

```bash
# interactively pick a base branch and create a PR
gh new

# create a PR and open it in the browser
gh new --open

# create a PR and add labels
gh new --open --label 'bug' --label 'enhancement,documentation'
gh new --open --label 'bug,enhancement'

# open the browser form to create a PR (gh native web mode)
gh new -- --web

# create a PR with reviewers
gh new -- --reviewer USER1,USER2

# create a draft PR
gh new --draft

# if a PR already exists for the current branch, open it
gh new --auto

# dry-run to inspect the gh command before running
gh new --dryrun
```

## fzf Key Bindings (inside the base branch picker)

| KEY      | ACTION                                                 |
|----------|--------------------------------------------------------|
| `ctrl-o` | Toggle between summary and full diff preview           |
| `ctrl-/` | Cycle preview window position (right → top → hidden)   |
| `ctrl-y` | Copy the base branch's latest commit hash to clipboard |

---

## workflow

```
gh new
  ↓
auto-push current branch if not pushed or behind remote
  ↓
fzf: pick base branch (sorted by most recent commit, with git show preview)
  ↓
gh pr create --base <selected> --head <current> --title <last commit> --body <last commit body>
  ↓
add labels (skip 'auto-merge' if already applied, warn if label not found)
  ↓
open PR in browser (if --open)
```

---

## configuration

| VARIABLE                   | PURPOSE                                              |
|----------------------------|------------------------------------------------------|
| `FZF_DEFAULT_OPTS`         | Global fzf options (colours, layout, keybindings, …) |
| `BASH_COMPLETION_USER_DIR` | Where `--setup` installs the completion script       |

---

## License

MIT
