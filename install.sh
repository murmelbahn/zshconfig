## Install packages
apt install -y zsh sshpass htop figlet tmux curl
curl -L git.io/antigen > ~/.antigen.zsh

## Make ZSH as default Shell
chsh -s $(which zsh)

## Remove existing config files
if test -f "~/.zshrc"; then
rm ~/.zshrc
    fi
if test -f "~/.antigen.zsh"; then
rm ~/.antigen.zsh
    fi
if test -f "~/.p10k.zsh"; then
rm ~/.p10k.zsh
    fi


## Symlink for new config
cd ~
ln -s ~/.zshconfig/zshrc .zshrc 
