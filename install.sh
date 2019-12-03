## Install packages
apt install -y zsh sshpass htop figlet curl
curl -L git.io/antigen > ~/.antigen.zsh

## Make ZSH as default Shell
chsh -s $(which zsh)

## Remove existing config files
if test -f "$FILE"; then
rm ~/.zshrc
    fi

## Symlink for new config
cd ~
ln -s ~/.zshconfig/zshrc .zshrc 
