brew install git
brew tap Homebrew/bundle
brew bundle
brew install vim --with-lua
curl -L http://get.oh-my.fish | fish
omf install agnoster

cd ~
mkdir .vim
mkdir .config
mkdir -p .git/hooks
mkdir .config/fish

curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh

ln -snvf dotfiles/.vimrc .vimrc
ln -snvf dotfiles/.tmux.conf .tmux.conf
ln -snvf dotfiles/.tigrc .tigrc
ln -snvf dotfiles/hooks/commit-msg .git/hooks/commit-msg
ln -snvf dotfiles/config.fish .config/fish/config.fish
ln -snvf dotfiles/.gvimrc .gvimrc
git config --global include.path ~/dotfiles/gitconfig

git clone git@github.com:powerline/fonts.git
cd fonts
./install.sh
cd ~
git clone https://github.com/dracula/iterm.git
cd iterm
open Dracula.itermcolors
