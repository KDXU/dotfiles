brew install git
brew tap Homebrew/bundle
brew bundle

# fisherman
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

if ! [ -x "$(command -v nvim)" ]; then
  pip install neovim
  brew install neovim/neovim/neovim
fi

cd ~
mkdir .vim

ln -sv dotfiles/config/ .config
ln -snvf dotfiles/bin/ bin/
ln -snvf dotfiles/dein.toml .dein.toml

ln -sv .config/nvim .vim
cp dotfiles/.iex.exs .

mkdir -p ~/.vim/dein
mkdir -p ~/.vim/colors

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh installer.sh ~/.cache/dein

curl https://sh.rustup.rs -sSf | sh

git config --global include.path ~/dotfiles/gitconfig

