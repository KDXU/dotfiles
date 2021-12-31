
set -ex

# install Nix

curl -L https://nixos.org/nix/install | sh

if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
  echo "${OS} setup"
  source ./setup_osx.sh
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
  echo "{OS} setup"
  source ./setup_unix.sh
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
  echo "{OS} setup"
  OS='Cygwin'
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

cd ~

mkdir -p ~/.config/karabiner/

ln -snvf ~/dotfiles/bin/ ~/bin
ln -snvf ~/dotfiles/tmux.conf .tmux.conf

ln -snvf ~/dotfiles/vimrc .vimrc
ln -snvf ~/dotfiles/zshrc .zshrc


mkdir -p ~/.vim/dein

# Dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh installer.sh ~/.cache/dein

# Git Config
git config --global include.path ~/dotfiles/gitconfig

