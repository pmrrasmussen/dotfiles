export ZDOTDIR="$HOME/dotfiles/zsh"

export EDITOR="vim"
export VISUAL="vim"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt HIST_SAVE_NO_DUPS

export LANG=en_US.UTF-8

# To quickly load vcpkg environment
export VCPKG_BINARY_SOURCES="files,/opt/vcpkg-binary-cache/,read"
