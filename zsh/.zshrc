alias gs="git status"
alias gca="git add .; git commit -m"
alias gpl="git pull"
alias gps="git push"
alias ga="git add"
alias gaa="git add ."
alias gc="git checkout"
alias gcn="git checkout -b"
alias gci='git checkout $(git branch --sort=-committerdate | fzf)'

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
alias ct='ctest --test-dir build --output-on-failure -R'
alias cti='ctest --test-dir build --output-on-failure -R "$(ctest --test-dir build -N | grep -oP "Test[ \t]+#\d*:\s*\K.*" | fzf)"'
alias clang-format="clang-format-21"

# Building with cmake
function cmi {
  target=$(ninja -C build -t targets | grep -v "/" | sed "s/\(.*\):.*/\1/" | fzf)
  cmake --build build --target $target
}
alias cmt="cmake --build build --target "
alias cm="cmake --build --preset=Default"
alias cf="cmake -D FIX=YES -D FORMAT_COMMAND=clang-format-21 -P cmake/lint.cmake"
alias cu="./tools/check_include_what_you_use.sh"

alias gpp="g++-13"

alias pa="source .venv/bin/activate"

alias hist='eval "$(fc -ln 0 | fzf --tac)"'

function whoisblocking {
  lsof -i "tcp:${1}"
}

if [[ "$(uname)" == "Darwin" ]]; then
    export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
    export PATH="/opt/homebrew/bin:$PATH"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# activate vi mode
bindkey -v
export KEYTIMEOUT=1

# sourcing plugins and dependencies
eval "$(zoxide init zsh)"


source $ZDOTDIR/deps/completion.zsh


fpath=("$ZDOTDIR/deps/" $fpath)
autoload -Uz pure_prompt; pure_prompt
zmodload zsh/complist

# Order of loading matters for these two 
source $ZDOTDIR/deps/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/deps/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

bindkey '^U' autosuggest-execute
bindkey '^Y' autosuggest-accept

# autoload -Uz compinit; compinit
# _comp_options+=(globdots)
