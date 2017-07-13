# brew install git
# brew tap Homebrew/bundle
# brew bundle

brew install neovim/neovim/neovim

cd ~
mkdir .vim
mkdir .config
mkdir -p .git/hooks

ln -sv .config/nvim .vim
mkdir -p ~/.vim/dein
mkdir -p ~/.vim/colors

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh installer.sh ~/.cache/dein


if ! [ -x "$(command -v kiex)" ]; then
  curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | zsh -s
fi

mkdir -p .git/hooks
mkdir .config
mkdir -p .config/nvim/dein
mkdir -p .config/nvim/colors

# シンボリックリンクだと nvim が認識してくれない
rm .config/nvim/init.vim
cp dotfiles/nvimrc .config/nvim/init.vim

ln -snvf dotfiles/nvimrc .vimrc

ln -snvf dotfiles/dein.toml .dein.toml

git config --global include.path ~/dotfiles/gitconfig

ln -snvf dotfiles/zshrc .zshrc
ln -snvf dotfiles/zshenv .zshenv

