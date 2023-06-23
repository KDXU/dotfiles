deps='
  libodbc1 \
  libsctp1 \
  libwxgtk3.0-0 \
  unixodbc-dev \
  libsctp-dev \
  libwxgtk3.0-dev \
  python3 \
  python3-pip \
  neovim \
  tmux \
  zsh \
  autoconf
  '
sudo apt-get update
sudo apt-get install -y --no-install-recomends $deps
