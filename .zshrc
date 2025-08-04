export ZSH="$HOME/.oh-my-zsh"

zstyle ':omz:update' mode auto      # update automatically without asking

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  git
  zsh-bat
  zsh-syntax-highlighting
)

export ZSH_THEME="robbyrussell"
export BAT_THEME="Solarized (dark)"

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

alias pip="pip3"

alias gst="git status"
alias gcm="git commit"
alias gpl="git pull"
alias gps="git push"
alias gad="git add"
alias gch="git checkout"
alias gchf='git checkout $(git branch --sort=-committerdate | fzf)'

alias v="nvim ."
alias rg="rg --hidden --glob '!.git'"
alias k="kubectl"
alias kn="kubens"
alias kc="kubectx"

alias gpp="g++-13"

alias pr="poetry run"
alias pi="poetry install"

function whoisblocking {
  lsof -i "tcp:${1}"
}

export PATH="/usr/local/share/dotnet:$PATH"
export DOTNET_ROOT="/usr/share/dotnet"

eval "$(/opt/homebrew/bin/brew shellenv)"

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/Users/p.m.rasmussen/.zshrc'

autoload -Uz compinit
compinit

# Load secrets
if test -f ~/.config/secrets; then
  source ~/.config/secrets
fi

# End of lines added by compinstall
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

fpath+=~/.zfunc; autoload -Uz compinit; compinit

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

