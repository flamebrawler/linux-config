#:./install.sh

# neovim
sudo apt remove neovim -y
mkdir -p ~/.config/nvim
curl -sL https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz \
| sudo tar -xzf - --strip-components=1 --overwrite -C /usr
# wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
# https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#
# cat nvimrc > ~/.config/nvim/init.vim
# ln -s ~/.config/nvim/init.vim ~/.nvimrc

cat init.lua > ~/.config/nvim/init.lua
ln -s ~/.config/nvim/init.vim ~/.nvimrc

sudo apt update -y
sudo apt install gcc -y
sudo apt install --yes -- python3-venv
sudo apt-get install ripgrep
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
cargo install tree-sitter-cli

# echo "call :PlugInstall"
# echo "call :COQdeps"
