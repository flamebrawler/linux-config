#:./install.sh

# neovim
mkdir -p ~/.config/nvim
curl -sL https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz \
| sudo tar -xzf - --strip-components=1 --overwrite -C /usr
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cat nvimrc > ~/.config/nvim/init.vim

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Cousine.zip
mkdir Cousine
unzip Cousine.zip -d Cousine
mkdir ~/.fonts
cp Cousine/*.ttf ~/.fonts
fc-cache -fv
rm -rf Cousine
rm Cousine.zip

echo "call :PlugInstall"
echo "Change the font of the terminal
