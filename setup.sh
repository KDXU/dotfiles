# brew install git
# brew tap Homebrew/bundle
# brew bundle

# brew install neovim/neovim/neovim

curl -L http://get.oh-my.fish | fish
omf install emoji-powerline

cd ~
mkdir .vim
mkdir .config
mkdir -p .git/hooks
mkdir .config/fish

ln -sv .config/nvim .vim
mkdir -p ~/.vim/dein
mkdir -p ~/.vim/colors

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh installer.sh ~/.config/nvim/dein

ln -snvf dotfiles/init.vim .config/nvim/init.vim
ln -snvf dotfiles/dein.toml .dein.toml

ln -snvf dotfiles/.tmux.conf .tmux.conf

ln -snvf dotfiles/.tigrc .tigrc

ln -snvf dotfiles/hooks/commit-msg .git/hooks/commit-msg

ln -snvf dotfiles/config.fish .config/fish/config.fish

git config --global include.path ~/dotfiles/gitconfig

# git clone git@github.com:powerline/fonts.git
# cd fonts
# ./install.sh
# cd ~
# git clone https://github.com/dracula/iterm.git
# cd iterm
# open Dracula.itermcolors
