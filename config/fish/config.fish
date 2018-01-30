set OTP_VERSION "20.2"
set ELIXIR_VERSION "1.6.1"

set -x EDITOR nvim

# Paths
test -d /usr/local/bin; and set -x PATH $PATH /usr/local/bin
test -d ~/bin; and set -x PATH $PATH ~/bin
test -d ~/.cargo/bin; and set -x PATH $PATH ~/.cargo/bin
test -d ~/packages/otp/{$ERLANG_VERSION}; and set -x PATH $PATH ~/packages/otp/{$ERLANG_VERSION}/bin
test -d ~/packages/elixir/{$ELIXIR_VERSION}; and set -x PATH $PATH ~/packages/elixir/{$ELIXIR_VERSION}/bin

# Opam
# eval (opam config env)

alias vim "nvim"
alias tis "tig status"
