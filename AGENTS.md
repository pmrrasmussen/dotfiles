# Repository Guidelines

## Project Structure & Module Organization
Each top-level folder mirrors its target tool so edits stay isolated. `nvim/` carries the LazyVim core (`lua/config/`) and overrides (`lua/plugins/`), `zsh/` hosts startup files plus `zsh/deps/`, and `tmux/` contains `tmux.conf` and the Catppuccin theme. Desktop and terminal tweaks live in `hypr/` and `alacritty/`, Git defaults sit in `git/config`, helper scripts in `scripts/`, and `setup.sh` bootstraps the symlinks.

## Build, Test, and Development Commands
- `./setup.sh` — remove clashing dotfiles, clone submodules, and recreate the required symlinks in `~/.config`.
- `nvim --headless "+Lazy! sync" +qa` — ensure LazyVim installs and exercises all declared plugins before committing.
- `stylua nvim` — apply the repository’s Lua formatting rules (two spaces, 120-character width) across every module.
- `tmux source-file tmux/tmux.conf` — reload key bindings and Catppuccin modules inside the active tmux server.
- `hyprctl reload` — pick up Hyprland configuration changes from `hypr/*.conf` without restarting the session.

## Coding Style & Naming Conventions
Lua files must follow `nvim/stylua.toml`, stay focused, and be named for their intent (`added.lua`, `disabled.lua`, etc.). Shell helpers should be POSIX-friendly, lowercase_with_underscores, and executable (the install script runs `chmod +x`). Keep tmux, Hypr, and Alacritty configs declarative—group similar directives, keep bindings sorted, and rely on comments only when the intent would otherwise be unclear. Treat `tmux/deps/` and `zsh/deps/` as vendored code and update them only when tracking a known upstream revision.

## Testing Guidelines
Run `nvim --headless "+checkhealth" +qa` whenever Lua touches plugins or dependencies. Lint shell helpers with `zsh -n scripts/<file>.sh` (plus `shellcheck` when available). Launch a disposable tmux server via `tmux -f tmux/tmux.conf -L test new-session -d` so status-line work never disrupts active sessions. Screenshot Hyprland or Alacritty visual tweaks when they impact UX. Test notes are required because nothing runs in CI.

## Commit & Pull Request Guidelines
Follow the short, imperative subjects already in history (`fix z completions`, `monitor`) and keep each commit scoped to one tool. PRs must explain the motivation, list manual commands you ran (`checkhealth`, `source-file`, `hyprctl reload`, etc.), and attach screenshots or logs for UI-impacting work. Reference related issues or upstream releases whenever bumping vendored dependencies or syncing `zsh/deps/` and `tmux/deps/`.

## Security & Configuration Tips
Never commit secrets, SSH keys, or machine-specific values; source them from untracked files referenced by `zsh/.zshenv` or `hypr/envs.conf`. When editing helpers such as `scripts/setup_ssh_agent.sh` or `scripts/start_tailscale.sh`, check for required binaries, fail fast, and avoid echoing sensitive data.
