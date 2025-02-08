# oh my zsh
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

echo 'alias vi="nvim"' >> ~/.zshrc
echo 'alias vim="nvim"' >> ~/.zshrc
echo 'unset LESS'
sed -i 's+robbyrussell+powerlevel10k/powerlevel10k+' ~/.zshrc
exec zsh

