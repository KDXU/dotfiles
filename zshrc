export ZSH="/Users/kyoko/.oh-my-zsh"

ZSH_THEME="af-magic"

export UPDATE_ZSH_DAYS=13

plugins=(
  git
  dotenv
  macos
  z
  docker
  stack
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
fpath=(/usr/share/zsh/$ZSH_VERSION/functions/ $fpath)

if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
  . ~/.nix-profile/etc/profile.d/nix.sh
fi

alias tis='tig status'

# User configuratios
ulimit -n 1024

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/usr/local/go/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export GOPATH="$HOME/src/"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/dotfiles/bin:$PATH"
export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"

export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(direnv hook zsh)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias cmakeclean='rm CMakeCache.txt cmake_install.cmake && rm -r CMakeFiles && rm Makefile'

export ANDROID_HOME=/Users/kyoko/Library/Android/sdk

export PATH=$PATH:~/Library/Android/sdk/platform-tools

#. $HOME/.nix-profile/etc/profile.d/nix.sh

export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/swagger-codegen@2/bin:$PATH"

#fpath=(/homebrew/share/zsh-completions $fpath)

autoload -U compinit
compinit -u

# opam configuration
test -r /Users/kyoko/.opam/opam-init/init.zsh && . /Users/kyoko/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
# rlwrap
alias ocaml='rlwrap ocaml'

fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

export $FPATH
export NIX_PATH=darwin-config=$HOME/.nixpkgs/darwin-configuration.nix:$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
