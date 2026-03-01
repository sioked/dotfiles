# Fish Shell

Shell config managed with [Oh My Fish](https://github.com/oh-my-fish/oh-my-fish) and [fisher](https://github.com/jorgebucaran/fisher).

## fzf

Fuzzy finder powered by [fzf](https://github.com/junegunn/fzf) via the [fzf.fish](https://github.com/PatrickF1/fzf.fish) plugin.

| Key | Action |
|---|---|
| `Ctrl+R` | Search command history |
| `Ctrl+T` | Search files in current directory |
| `Ctrl+Alt+S` | Search git status |
| `Ctrl+Alt+L` | Search git log |
| `Ctrl+Alt+P` | Search running processes |
| `Ctrl+Alt+V` | Search shell variables |

Results are shown in an interactive fuzzy finder — type to filter, `Enter` to select, `Ctrl+C` to cancel.

## Plugins

Managed via `fisher`. To see installed plugins:

```sh
fisher list
```

To add a new plugin:

```sh
fisher install <plugin>
```

To update all plugins:

```sh
fisher update
```
