if status --is-login
    set -x PATH $PATH /usr/local/bin
    set -x PATH $PATH ~/bin
    set -x PATH $PATH ~/.cargo/bin
    set -x PATH $PATH /usr/local/share/git-core/contrib/diff-highlight
    set -x PATH $PATH ~/packages/otp/20.0.4/bin
    set -x PATH $PATH ~/packages/elixir/1.5.2/bin
    set -x SSH_AUTH_SOCK ~/.gnupg/S.gpg-agent.ssh
end
if status --is-login
    set -x PATH $PATH /usr/local/bin
    set -x PATH $PATH ~/bin
    set -x PATH $PATH ~/.cargo/bin
    set -x PATH $PATH /usr/local/share/git-core/contrib/diff-highlight
end

alias vim "nvim"
alias tis "tig status"
