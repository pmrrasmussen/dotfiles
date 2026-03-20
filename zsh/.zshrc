. /etc/os-release

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
alias tt="bash ~/dotfiles/tmux/tmux-sessionizer.sh"

# Unit testing with ctest
alias ct='ctest --test-dir build --output-on-failure -R'
alias cti='ctest --test-dir build --output-on-failure -R "$(ctest --test-dir build -N | grep -oP "Test[ \t]+#\d*:\s*\K.*" | fzf)"'

# Building with cmake
function cmi {
  target=$(ninja -C build -t targets | grep -v "/" | sed "s/\(.*\):.*/\1/" | fzf)
  cmake --build build --target $target
}
alias cmt="cmake --build build --target "
alias cm="cmake --build --preset=Default"
alias cf="cmake -D FIX=YES -D FORMAT_COMMAND=clang-format-21 -P cmake/lint.cmake"
alias cu="./tools/check_include_what_you_use.sh"
alias setup-ssh="sudo sh ~/dotfiles/scripts/start_tailscale.sh; sh ~/dotfiles/scripts/setup_ssh_agent.sh"
alias set-models-data-dir="export TWIG_BASE_DATA_DIR=/mnt/nvmeu2_2/data"
alias set-epex-data-dir='export TWIG_BASE_DATA_DIR="$HOME/EPEXcpp/EPEX/tests/data"'


alias gpp="g++-13"

alias pa="source .venv/bin/activate"

alias hist='eval "$(fc -ln 0 | fzf --tac)"'

function whoisblocking {
  lsof -i "tcp:${1}"
}

if [[ "$(uname)" == "Darwin" ]]; then
    export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH="/Users/peter/.cargo/bin:$PATH"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# activate vi mode
bindkey -v
export KEYTIMEOUT=1



# Order of loading matters for these two 
source $ZDOTDIR/deps/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/deps/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/deps/completion.zsh

fpath=("$ZDOTDIR/deps/" $fpath)
autoload -Uz pure_prompt; pure_prompt
zmodload zsh/complist

# sourcing plugins and dependencies
eval "$(zoxide init zsh)"

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

bindkey '^[h' history-beginning-search-backward
bindkey '^[l' history-beginning-search-forward

bindkey '^[j' autosuggest-execute
bindkey '^[k' autosuggest-accept

# omarchy related stuff
if [ -f /etc/os-release ]; then
    . /etc/os-release
else
    ID=unknown
fi

if [[ "$ID" = "arch" ]]; then
    export SSH_AUTH_SOCK="/home/peter/.ssh/agent"
    ssh-add /home/peter/.ssh/id_ecdsa_sk_rk 2>/dev/null
fi

# autoload -Uz compinit; compinit
# _comp_options+=(globdots)

function prun {
    # usage: prun host gpu path/to/experiment.py
    if [[ $# -ne 3 ]]; then
        echo "Usage: prun host gpu path/to/experiment.py"
        return 1
    fi

    local HOST="$1"
    local DEVICE="$2"
    local SCRIPT="$3"

    git fetch --quiet

    if ! git diff-index --quiet HEAD --; then
        echo "ERROR: uncommitted changes."
        return 1
    fi

    if ! git rev-parse --abbrev-ref '@{u}' >/dev/null 2>&1; then
        echo "ERROR: no upstream branch configured."
        return 1
    fi

    if [ "$(git rev-parse @)" != "$(git rev-parse @{u})" ]; then
        echo "ERROR: local branch does not match origin (not up-to-date or diverged)."
        return 1
    fi

    local REVISION
    REVISION="$(git rev-parse --short HEAD)"

    local MESSAGE
    MESSAGE="$(git show -s --format=%s HEAD)"

    local DIR
    DIR="${PWD##*/}"

    local REPO_URL
    REPO_URL="$(git remote get-url origin)"

    ssh -A -q "$HOST" \
        DIR="$DIR" \
        DEVICE="$DEVICE" \
        SCRIPT="$SCRIPT" \
        REVISION="$REVISION" \
        MESSAGE="$MESSAGE" \
        REPO_URL="$REPO_URL" \
        HOST_NAME="$HOST" \
        'bash -s' <<'EOF'
set -euxo pipefail

RUN_DIR="$HOME/runners/$DIR/$DEVICE"

if [[ ! -d "$RUN_DIR/.git" ]]; then
    mkdir -p "$(dirname "$RUN_DIR")"
    git clone "$REPO_URL" "$RUN_DIR"
fi

cd "$RUN_DIR"
git fetch
git checkout "$REVISION"

uv sync --all-groups

mkdir -p "runs/$REVISION"
touch "runs/$REVISION/output.log"

tmux new-session -d -s "${DIR}-${DEVICE}-${REVISION}" -c "$RUN_DIR" "
    ulimit -n 1000000
    export REVISION=$(printf '%q' "$REVISION")
    export MESSAGE=$(printf '%q' "$MESSAGE")
    export HOST=$(printf '%q' "$HOST_NAME")
    export SCRIPT=$(printf '%q' "$SCRIPT")
    export CUDA_VISIBLE_DEVICES=$(printf '%q' "$DEVICE")
    uv run python -u $(printf '%q' "$SCRIPT") 2>&1 | tee -a runs/$REVISION/output.log
"

sleep 1
tail -n +1 -F "$RUN_DIR/runs/$REVISION/output.log"
EOF
}

function run {
    #usage: run host gpu path/to/experiment.py
    if [[ $# -ne 3 ]]; then
        echo "Usage: run host gpu path/to/experiment.py"
        return 1
    fi

    local HOST="$1"
    local DEVICE="$2"
    local SCRIPT="$3"

    git fetch --quiet

    if ! git diff-index --quiet HEAD --; then
        echo "ERROR: uncommitted changes."
        return 1
    fi

    if [ "$(git rev-parse @)" != "$(git rev-parse @{u})" ]; then
        echo "ERROR: local branch does not match origin (not up-to-date or diverged)."
        return 1
    fi

    local REVISION="$(git rev-parse --short HEAD)"
    local MESSAGE="$(git show -s --format=%s)"
    local DIR="${PWD##*/}"
    ssh -A -q "$HOST" << EOF
set -ex
cd ~/runners/${DIR}
git fetch
git checkout ${REVISION}
source .venv/bin/activate
uv sync --all-groups
mkdir -p runs/${REVISION}
export DIR=${DIR}
export DEVICE=${DEVICE}
ulimit -n 1000000
tmux new-session -d -s "${DIR}-${REVISION}" '
    export REVISION=${REVISION}
    export MESSAGE="${MESSAGE}"
    export HOST=${HOST}
    export SCRIPT=${SCRIPT}
    CUDA_VISIBLE_DEVICES=${DEVICE} sh ${SCRIPT} 2>&1 | tee runs/${REVISION}/output.log 
'
sleep 1
tail -f runs/${REVISION}/output.log
EOF
}


