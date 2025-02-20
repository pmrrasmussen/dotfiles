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

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias pip="pip3"

alias gst="git status"
alias gcm="git commit"
alias gpl="git pull"
alias gps="git push"
alias gad="git add"
alias gch="git checkout"

alias v="nvim ."
alias p="poetry run nvim ."
alias t="tmux a -t"
alias vlogin="vault login -method=oidc"
alias rg="rg --hidden --glob '!.git'"
alias k="kubectl"

alias pr="poetry run"
alias pi="poetry install"

function whoisblocking {
  lsof -i "tcp:${1}"
}

export PATH="/usr/local/share/dotnet:$PATH"
export DOTNET_ROOT="/usr/share/dotnet"

eval "$(/opt/homebrew/bin/brew shellenv)"

. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/plugins/java/set-java-home.zsh"
. "/Users/p.m.rasmussen/repos/avocado-tooling/cli-utils.sh"

export PATH="/Users/p.m.rasmussen/.local/bin:$PATH"
export VAULT_ADDR="https://vault.maersk-digital.net"


# export LDFLAGS="-L/opt/homebrew/opt/libxslt/lib -L/opt/homebrew/Cellar/freetds/1.4.23/lib -L/opt/homebrew/Cellar/openssl@3/3.3.1/lib"
# export CFLAGS="-I/opt/homebrew/opt/libxslt/include -I/opt/homebrew/Cellar/freetds/1.4.23/include -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1/"


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
