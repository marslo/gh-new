## [1.0.5](https://github.com/marslo/gh-new/compare/v1.0.4...v1.0.5) (2026-05-28)

### fix

* fix: fixed the reading JIRA_URL from environment variable

### chore

* chore: wrap JIRA-ID in PR body to URL

## [1.0.4](https://github.com/marslo/gh-new/compare/v1.0.3...v1.0.4) (2026-05-21)

### chore

* chore: bump submodule new version - percentage-based dynamic preview window re-sizing in fzf
* chore: bump submodule new version

### ci

* ci: fix the 'Node.js 20 actions are deprecated' issue in pre-commit workflow

### docs

* docs: add icon/badge in readme

## [1.0.3](https://github.com/marslo/gh-new/compare/v1.0.2...v1.0.3) (2026-05-19)

### chore

* chore: submodule update
  see: marslo/gh-utility@e0aec1d

* chore(submodule): submodule update;  using pre-commit workflow instead of pre-commit application, to disable PR auto creation

### ci

* ci: disable precommit automatic upgrade via PR

### docs

* docs: update the help screenshot

## [1.0.2](https://github.com/marslo/gh-new/compare/v1.0.1...v1.0.2) (2026-05-07)

### Others

* add `--setup` params into help message ([3128304](https://github.com/marslo/gh-new/commit/31283040a5ec08bc089601a98caaf58576f9633d))

## [1.0.1](https://github.com/marslo/gh-new/compare/v1.0.0...v1.0.1) (2026-05-07)

### Others

* update the submodule (utils) for bash_completion enhancement ( [b99f4be](https://github.com/marslo/gh-utility/commit/b99f4be85fc6c60ff524b6c35dede3bcc8a38a44), [4052204](https://github.com/marslo/gh-new/commit/40522044685508659873cd541d1df7eb342e2a3e) )

# 1.0.0 (2026-05-07)

### Features

* **docs,submodule,bash_completion:** add readme; upgrade the bash_completion for both `$ gh-new <TAB>` and `$ gh new <TAB>`; add setup script ([204819e](https://github.com/marslo/gh-new/commit/204819e5a8a14b4b41453626ca77d4aab4540a8d))
* init gh-new and bash_completion ([2b99a75](https://github.com/marslo/gh-new/commit/2b99a7548baa022b5332c8ee33932941a126eaca))

### Chores

* **bash_completion:** replace inline `etc/gh-new.sh` with unified submodule-provided completion script ([30b42cf](https://github.com/marslo/gh-new/commit/30b42cf452f3fbc603001242aa291b8381624436))
* initial commit: add `LICENSE` and stub `README.md` ([a0d0aad](https://github.com/marslo/gh-new/commit/a0d0aad0be502126e72a9d7fce09f58ef2826625))

### Miscellaneous

* **pre-commit:** autoupdate — `black` `26.1.0 → 26.3.1`, `typos` `v1.43.5 → v1` ([da3004f](https://github.com/marslo/gh-new/commit/da3004f7bda5d1c259c46c3ccea8f017884f4274))
