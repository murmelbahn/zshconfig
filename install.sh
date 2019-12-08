#!/bin/bash

## Define Arrays
packages=( "zsh" "htop" "figlet" "tmux" "curl" )
configfiles=( ".zshrc" ".antigen.zsh" ".p10k.zsh" ".tmux.conf" ".config/htop/htoprc" "/usr/share/nano/yaml.nanorc" )
configfileslinux=( "/etc/nanorc" )
motdfiles=( "/etc/update-motd.d/00-header" "/etc/update-motd.d/10-uname" "/etc/update-motd.d/10-sysinfo" "/etc/update-motd.d/90-footer" )


cd ~

if test -d ~/.config/htop; then
  echo Htop folder found - skipping removing.
else
mkdir ~/.config/htop
fi


## Install packages

if [ "$(uname)" = "Darwin" ]; then
  echo MacOS found - no installation of packages needed.
else
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
fi

## Remove Config Files

for j in "${configfiles[@]}"
do
  rm $j
done

if [ "$(uname)" != "Darwin" ]; then
  for l in "${configfileslinux[@]}"
  do
    rm $j
  done
fi


## Remove Motd Files
if [ "$(uname)" = "Darwin" ]; then
  echo MacOS found - no motd files to remove.
else
for k in "${motdfiles[@]}"
do
  if test -f $k; then
  rm $k
  fi
done
fi

## Install Antigen
curl -L git.io/antigen > .antigen.zsh

## Create Symlinks
ln -s ~/.zshconfig/zshrc .zshrc
ln -s ~/.zshconfig/yaml.nanorc /usr/share/nano/yaml.nanorc
ln -s ~/.zshconfig/tmux .tmux.conf
ln -s ~/.zshconfig/htoprc .config/htop/htoprc
ln -s ~/.zshconfig/p10k.zsh .p10k.zsh
if [ "$(uname)" != "Darwin" ]; then
  ln -s ~/.zshconfig/nanorc /etc/nanorc
else
  echo MacOS found - No linking of Nanorc needed.
fi



## Make ZSH as default Shell
if [ "$(uname)" = "Darwin" ]; then
  echo MacOS found - ZSH is already default shell.
else
chsh -s $(which zsh)
fi


## Copy Files, fix permissions
if [ "$(uname)" = "Darwin" ]; then
  echo MacOS found - No motd changes needed.
else
cp ~/.zshconfig/motd/* /etc/update-motd.d/
chmod +x /etc/update-motd.d/*
echo > /etc/motd
fi
