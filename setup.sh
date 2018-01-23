cd ~

ln -snvf dotfiles/config/ ~/.config/
ln -snvf dotfiles/bin/ bin/
ln -snvf dotfiles/dein.toml .dein.toml

ln -sv .config/nvim .vim
ln -snvf dotfiles/.iex.exs .

mkdir -p ~/.vim/dein

# Dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh installer.sh ~/.cache/dein

# Rust
curl https://sh.rustup.rs -sSf | sh

# Git Config
git config --global include.path ~/dotfiles/gitconfig

sh ~/dotfiles/install_erlang.sh
sh ~/dotfiles/install_elixir.sh
