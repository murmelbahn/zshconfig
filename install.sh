## Install packages

apt install -y zsh sshpass htop figlet tmux curl
cd ~

## Make ZSH as default Shell
chsh -s $(which zsh)

## Remove existing config files
if test -f ~/.zshrc; then
rm .zshrc
    fi
if test -f ~/.antigen.zsh; then
rm ~/.antigen.zsh
    fi
if test -f ~/.p10k.zsh; then
rm ~/.p10k.zsh
    fi

curl -L git.io/antigen > ~/.antigen.zsh

## Symlink for new config
ln -s ~/.zshconfig/zshrc .zshrc 

## Emtpy Motd
if test -f /etc/update-motd.d/10-uname; then
rm /etc/update-motd.d/10-uname
    fi
if test -f /etc/update-motd.d/00-header; then
rm /etc/update-motd.d/00-header
    fi
if test -f /etc/update-motd.d/10-sysinfo; then
rm /etc/update-motd.d/10-sysinfo
    fi
if test -f /etc/update-motd.d/90-footer; then
rm /etc/update-motd.d/90-footer
    fi

## Copy Files, fix permissions
cp ~/.zshconfig/motd/* /etc/update-motd.d/
chmod +x /etc/update-motd.d/*
echo > /etc/motd

## htop config
if test -f ~/.config/htop/htoprc; then
rm ~/.config/htop/htoprc
    fi
ln -s ~/.zshconfig/htoprc .config/htop/htoprc



