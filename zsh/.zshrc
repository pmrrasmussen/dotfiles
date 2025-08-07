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

if [[ "$(uname)" == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

autoload -Uz compinit; compinit
_comp_options+=(globdots)

source $ZDOTDIR/deps/completion.zsh

fpath=("$ZDOTDIR/deps/" $fpath)
autoload -Uz pure_prompt; pure_prompt

eval "$(zoxide init zsh)"

bindkey -v
export KEYTIMEOUT=1

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
