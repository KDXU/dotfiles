set OTP_VERSION "20.2"
set ELIXIR_VERSION "1.6.1"

set -x EDITOR nvim

# Paths
test -d /usr/local/bin; and set -x PATH $PATH /usr/local/bin
test -d ~/bin; and set -x PATH $PATH ~/bin
test -d ~/.cargo/bin; and set -x PATH $PATH ~/.cargo/bin
test -d ~/packages/otp/{$ERLANG_VERSION}; and set -x PATH $PATH ~/packages/otp/{$ERLANG_VERSION}/bin
test -d ~/packages/elixir/{$ELIXIR_VERSION}; and set -x PATH $PATH ~/packages/elixir/{$ELIXIR_VERSION}/bin
test -d ~/packages/otp/{$OTP_VERSION}/bin; and set -x PATH $PATH ~/packages/otp/{$OTP_VERSION}/bin
test -d ~/packages/elixir/{$ELIXIR_VERSION}/bin; and set -x PATH $PATH ~/packages/elixir/{$ELIXIR_VERSION}/bin
test -d /usr/local/go/bin; and set -x PATH $PATH /usr/local/go/bin
# Opam
# eval (opam config env)
eval (direnv hook fish)

alias vim "nvim"
alias tis "tig status"
