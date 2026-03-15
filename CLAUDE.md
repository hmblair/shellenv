<!-- claude-shellenv:start -->
# shellenv

Use the `path` and `envs` commands to make permanent changes to PATH entries and environment variables. Do not manually edit shell config files (`~/.zshrc`, `~/.zprofile`, etc.) for these purposes.

- `path add <path>...` — add directories to PATH permanently
- `path remove [path]` — remove a PATH entry
- `envs add <name> <value>` — set a persistent environment variable
- `envs remove [name]` — remove a persistent variable

Changes take effect in new shells via `eval "$(path read)"` and `eval "$(envs read)"` in `~/.zshrc`.
<!-- claude-shellenv:end -->
