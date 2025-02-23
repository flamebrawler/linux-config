cat tmux.conf > ~/.tmux.conf
cat bashrc >> ~/.bashrc
cat inputrc > ~/.inputrc
#vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cat vimrc > ~/.vimrc
echo "use :PlugInstall in vim to install plugins"

