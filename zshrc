export ZSH="/Users/kyoko/.oh-my-zsh"

ZSH_THEME="af-magic"

export UPDATE_ZSH_DAYS=13

plugins=(
  git
  dotenv
  osx
  z
  docker
  sbt
  stack
  git-flow
)

source $ZSH/oh-my-zsh.sh

ulimit -n 1024

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias lst='ls -ltr'
alias la='ls -la'
alias ll='ls -l'
alias so='source'
alias diff='diff -U1'
alias tis='tig status'

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/usr/local/go/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export GOPATH="$HOME/src/"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/dotfiles/bin:$PATH"
export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias cmakeclean='rm CMakeCache.txt cmake_install.cmake && rm -r CMakeFiles && rm Makefile'

export ANDROID_HOME=/Users/kyoko/Library/Android/sdk

export PATH=$PATH:~/Library/Android/sdk/platform-tools

. $HOME/.nix-profile/etc/profile.d/nix.sh

export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/swagger-codegen@2/bin:$PATH"

fpath=(/path/to/homebrew/share/zsh-completions $fpath)

autoload -U compinit
compinit -u

if [[ -d /Applications/MacVim.app ]]; then # MacVimが存在するならば
    export PATH="/Applications/MacVim.app/Contents/bin:$PATH"
fi

# opam configuration
test -r /Users/kyoko/.opam/opam-init/init.zsh && . /Users/kyoko/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
# rlwrap
alias ocaml='rlwrap ocaml'

eval "$(direnv hook zsh)"
