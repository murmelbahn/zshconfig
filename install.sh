## Install packages
apt install -y zsh zsh-antigen sshpass htop finglet curl


## Set ZSH as default shell
chsh -s $(which zsh)


rm ~/.zshrc
cd ~
ln -s ~/.zshconfig/zshrc .zshrc 
