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

alias ta="tmux a -t"
alias tn="tmux new -s"
alias ts="tmux list-sessions"
alias tk="tmux kill-server"

# Unit testing with ctest
alias cti='ctest preset=Default -R "$(ctest -N | grep -oP "Test #\d+:\s*\K.*" | fzf)"'
alias ct='ctest preset=Default -R '

# Building with cmake
function cmi {
  target=$(ninja -t targets | grep -v "/" | sed "s/\(.*\):.*/\1/" | fzf)
  cmake --build . --target $target
}
alias cm="cmake --build . --target "

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
