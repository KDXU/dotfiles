brew install git
brew tap Homebrew/bundle
brew bundle

if ! [ -x "$(command -v nvim)" ]; then
  brew install neovim
  pip3 install neovim
fi

# fisherman
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

cd ~
mkdir .vim

