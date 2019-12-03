#!/bin/bash

## Define Arrays
packages=( "zsh" "sshpass" "htop" "figlet" "tmux" "curl" )
configfiles=( ".zshrc" ".antigen.zsh" ".p10k.zsh" ".tmux.conf" ".config/htop/htoprc")
motdfiles=( "/etc/update-motd.d/00-header" "/etc/update-motd.d/10-uname" "/etc/update-motd.d/10-sysinfo" "/etc/update-motd.d/90-footer" )
cd ~

## Install packages
for i in "${packages[@]}"
do

dpkg -s $i &> /dev/null

if [ $? -eq 0 ]; then
echo $i is installed - skipping.
    else
        $i is missing. Installing now.
        apt install -y $i
        fi
 done

## Remove Config Files

for j in "${configfiles[@]}"
do
  rm $j
done 

## Remove Motd Files

for k in "${motdfiles[@]}"
do
  if test -f $k; then
  rm $k
  fi
done

## Install Antigen
curl -L git.io/antigen > .antigen.zsh


## Create Symlinks
ln -s ~/.zshconfig/zshrc .zshrc
ln -s ~/.zshconfig/tmux .tmux.conf
ln -s ~/.zshconfig/htoprc .config/htop/htoprc
ln -s ~/.zshconfig/p10k.zsh .p10k.zsh

## Make ZSH as default Shell
chsh -s $(which zsh)



## Copy Files, fix permissions
cp ~/.zshconfig/motd/* /etc/update-motd.d/
chmod +x /etc/update-motd.d/*
echo > /etc/motd

