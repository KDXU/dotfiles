export ZSH="/Users/kyoko/.oh-my-zsh"

ZSH_THEME="af-magic"

export UPDATE_ZSH_DAYS=13

plugins=(
  git
  direnv
  dotenv
  macos
  z
  docker
  stack
)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='code'
fi

# Aliases
alias zshconfig="vim ~/.zshrc"
alias tis='tig status'


# User Resource configuratios
ulimit -n 1024

# User configuration
export MANPATH="/usr/local/man:$MANPATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/usr/local/go/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export GOPATH="$HOME/src/"
export PATH="$GOPATH/bin:$PATH"
export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
. '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'

eval "$(direnv hook zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

fpath=(/usr/share/zsh/$ZSH_VERSION/functions/ $fpath)

autoload -U compinit

compinit -u

export PATH="$PATH:/nix/var/nix/profiles/default/bin"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
alias readlink=greadlink

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}


export FPATH=$FPATH

export PATH="/usr/local/opt/swagger-codegen@2/bin:$PATH"
source /Users/kyoko/.oh-my-zsh/custom/plugins/nix-shell/nix-shell.plugin.zsh

alias ssh-add-normal='ssh-add -D > /dev/null 2>&1; kill -0 ${SSH_AGENT_PID} > /dev/null 2>&1; if [ $? -ne 0 ]; then eval `ssh-agent`; fi; ssh-add ~/.ssh/id_ed25519'
eval "$(ssh-agent)"
