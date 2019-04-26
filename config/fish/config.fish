set ERLANG_VERSION "21.3"

set -x EDITOR nvim

# Paths
test -d /usr/local/bin; and set -x PATH $PATH /usr/local/bin
test -d ~/bin; and set -x PATH $PATH ~/bin
test -d ~/.cargo/bin; and set -x PATH $PATH ~/.cargo/bin
test -d /usr/local/go/bin; and set -x PATH $PATH /usr/local/go/bin
test -d ~/packages/elixir/bin; and set -x PATH $PATH ~/packages/elixir/bin
set -x PATH $PATH ~/.yarn/bin
set -x PATH $PATH ~/.config/yarn/global/node_modules/.bin
set -x GOPATH $HOME/src/
set -x PATH $PATH $GOPATH/bin
set -x PATH $PATH $HOME/dotfiles/bin

# ssh-auth-sock
set -x SSH_AUTH_SOCK $HOME/.gnupg/S.gpg-agent.ssh

# Opam
eval (direnv hook fish)

# aliases
alias vim "nvim"
alias tis "tig status"
alias mic "mix compile"
alias mit "mix ecto.reset; mix test"
alias mif "mix format"
alias mit "env MIX_ENV=test mix local_test"
alias mir "mix release"
alias ocaml "rlwrap ocaml"

# pyenv
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH $PATH $PYENV_ROOT/bin
eval (pyenv init - | source)
eval (pyenv virtualenv-init - | source)

# kerl
source ~/.otp/$ERLANG_VERSION/activate.fish

# peco
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths

set -g fish_user_paths "/usr/local/opt/postgresql@10/bin" $fish_user_paths

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kyoko/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/kyoko/google-cloud-sdk/path.fish.inc'; else; . '/Users/kyoko/google-cloud-sdk/path.fish.inc'; end; end
