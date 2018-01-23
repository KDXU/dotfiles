OTP_VERSION="20.2"
ELIXIR_VERSION="1.6.0"

if status --is-login
    set -x PATH $PATH /usr/local/bin
    set -x PATH $PATH ~/bin
    set -x PATH $PATH ~/.cargo/bin
    set -x PATH $PATH ~/packages/otp/${ERLANG_VERSION}/bin
    set -x PATH $PATH ~/packages/${ELIXIR_VERSION}/bin
end

alias vim "nvim"
alias tis "tig status"
