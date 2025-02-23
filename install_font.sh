wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Cousine.zip
mkdir Cousine
unzip Cousine.zip -d Cousine
mkdir ~/.fonts
cp Cousine/*.ttf ~/.fonts
fc-cache -fv
rm -rf Cousine
rm Cousine.zip

echo "Change the font of the terminal"
