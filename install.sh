## Install packages
apt install -y zsh zsh-antigen sshpass htop figlet curl

## Make ZSH as default Shell
chsh -s $(which zsh)

## Remove existing config files
if test -f "$FILE"; then
rm ~/.zshrc
    fi

## Symlink for new config
cd ~
ln -s ~/.zshconfig/zshrc .zshrc 
