<!-- claude-shellenv:start -->
# shellenv

Use the `path` and `envs` commands to make permanent changes to PATH entries and environment variables. Do not manually edit shell config files (`~/.zshrc`, `~/.zprofile`, etc.) for these purposes.

- `path groups` — list available path groups
- `path add --group <group> <path>...` — add directories to PATH permanently (always use `--group` to skip interactive menu)
- `path remove [path]` — remove a PATH entry
- `envs groups` — list available env groups
- `envs add --group <group> <name> <value>` — set a persistent environment variable (always use `--group` to skip interactive menu)
- `envs remove [name]` — remove a persistent variable

Changes take effect in new shells via `eval "$(path read)"` and `eval "$(envs read)"` in `~/.zshrc`.
<!-- claude-shellenv:end -->
