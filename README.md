# shellenv

Shell environment management tools for zsh. Organizes PATH entries and environment variables into named groups.

## Commands

### path

Manages the `PATH` environment variable through group files stored in `~/.paths/`.

```
path read                  # Output export statement (use with eval)
path add <path>...         # Add path(s) to a group
path remove [path]         # Remove a path from a group
path clean                 # Remove nonexistent paths from groups
path list                  # Show all paths in current PATH
path find <pattern>        # Find executables matching pattern
path dir                   # Show config directory
```

### envs

Manages persistent environment variables through group files stored in `~/.envs/`.

```
envs read                  # Output export statements (use with eval)
envs add <name> <value>    # Add or update a variable in a group
envs remove [name]         # Remove a variable
envs clean                 # Remove variables not set in current env
envs list [--all]          # Show managed variables (--all for all)
envs find <pattern>        # Find variables matching pattern
envs dir                   # Show config directory
```

## Installation

```zsh
git clone https://github.com/hmblair/shellenv.git ~/.local/share/shellenv
cd ~/.local/share/shellenv
make install
```

This symlinks `path` and `envs` into `~/.local/bin` and completions into `~/.local/share/zsh/site-functions`. Override with `make install PREFIX=/usr/local`.

Add to `~/.zshrc`:

```zsh
eval "$(path read)"
eval "$(envs read)"
```

## Storage

Both commands store configuration as plain text files organized into named groups:

- `~/.paths/<group>` — one path per line
- `~/.envs/<group>` — one `KEY=VALUE` per line

## License

MIT
