export ZDOTDIR="$HOME/dotfiles/zsh"


export EDITOR="nvim"
export VISUAL="nvim"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt hist_find_no_dups

export LANG=en_US.UTF-8

# To quickly load vcpkg environment
export VCPKG_BINARY_SOURCES="files,/opt/vcpkg-binary-cache/,read"
export TWIG_BASE_DATA_DIR="$HOME/EPEXcpp/EPEX/tests/data"
