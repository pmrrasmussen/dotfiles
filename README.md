# Dotfiles Overview

These dotfiles configure the editor, shell, terminal, window manager, and supporting tools I use day to day. Everything is organized by tool so changes stay scoped, and `setup.sh` recreates the required symlinks inside `$HOME`. For contribution guidance and coding conventions, see `AGENTS.md`.

## Getting Started
```bash
git clone https://github.com/pmrrasmussen/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup.sh
```
The script removes conflicting configs, initializes submodules, and links files into `~/.config`. After it completes, restart your terminal (and Hyprland, if running) so new settings load.

## Directory Guide
- `alacritty/` – theme, font, and padding settings for the Alacritty terminal.
- `git/` – shared Git configuration that ends up in `~/.config/git/config`.
- `hypr/` – Hyprland window manager settings (`hyprland.conf`, `bindings.conf`, monitors, etc.) plus lock, idle, and sunset helpers.
- `nvim/` – LazyVim-based Neovim config. Core behavior lives under `lua/config/`, while `lua/plugins/*.lua` enable, disable, or tweak plugins. Formatting is governed by `stylua.toml`.
- `scripts/` – helper utilities such as `setup_ssh_agent.sh` and `start_tailscale.sh`. `setup.sh` also marks every script as executable.
- `tmux/` – primary `tmux.conf` plus the Catppuccin status line/theme tracked under `tmux/deps/`.
- `zsh/` – `.zshenv`, extra configuration, and the vendored plugins found in `zsh/deps/` (syntax highlighting, autosuggestions, prompt, etc.).
- `AGENTS.md` – contributor guidelines covering style expectations, testing, and PR etiquette.
- `setup.sh` – installation script that wipes stale dotfiles, clones required repos, and recreates symlinks.

## Keeping Things Updated
- Run `nvim --headless "+Lazy! sync" +qa` after editing Lua to ensure plugins install cleanly.
- Use `tmux source-file tmux/tmux.conf` or `hyprctl reload` to pick up config changes without restarting.
- When updating vendored dependencies in `zsh/deps/` or `tmux/deps/`, note the upstream version in your commit message.

That’s it—review `AGENTS.md` before opening a PR, and tailor the configs under each directory to match your local environment.
