set ELIXIR_VERSION "v1.6.5"
set ERLANG_VERSION "21.0-rc1"

set -x EDITOR nvim

# Paths
test -d /usr/local/bin; and set -x PATH $PATH /usr/local/bin
test -d ~/bin; and set -x PATH $PATH ~/bin
test -d ~/.cargo/bin; and set -x PATH $PATH ~/.cargo/bin
test -d /usr/local/go/bin; and set -x PATH $PATH /usr/local/go/bin
test -d ~/packages/elixir/$ELIXIR_VERSION/bin; and set -x PATH $PATH ~/packages/elixir/$ELIXIR_VERSION/bin

set -x PATH $PATH $HOME/dotfiles/bin

# ssh-auth-sock
set -x SSH_AUTH_SOCK $HOME/.gnupg/S.gpg-agent.ssh

# Opam
# eval (opam config env)
eval (direnv hook fish)

alias vim "nvim"
alias tis "tig status"
alias mic "mix compile"
alias mit "mix test"
alias mir "mix release"

# pyenv
set -x PYENV_ROOT $HOME/.pyenv
status --is-interactive; and source (pyenv init -|psub)


# kerl
source ~/.otp/$ERLANG_VERSION/activate.fish

