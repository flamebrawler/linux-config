#:./install.sh

# neovim
sudo apt remove neovim -y
mkdir -p ~/.config/nvim
curl -sL https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz \
| sudo tar -xzf - --strip-components=1 --overwrite -C /usr
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz j
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cat nvimrc > ~/.config/nvim/init.vim
ln -s ~/.config/nvim/init.vim ~/.nvimrc

sudo apt install --yes -- python3-venv
sudo apt-get install ripgrep

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Cousine.zip
mkdir Cousine
unzip Cousine.zip -d Cousine
mkdir ~/.fonts
cp Cousine/*.ttf ~/.fonts
fc-cache -fv
rm -rf Cousine
rm Cousine.zip

#tmux tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sudo chsh -s $(which zsh)

echo "call :PlugInstall"
echo "call :COQdeps"
echo "tmux :source ~/.tmux.conf"
echo "press Ctrl-a + I (capital)"
echo "Change the font of the terminal
