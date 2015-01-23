#!/bin/bash

EXCLUDE=("install.sh", "terminal", "git","fonts")

shopt -s dotglob

for dotfile in *

do
  if [[ ${EXCLUDE[*]} =~ $dotfile ]]; then
    echo "$dotfile will not be simlinked!"
  else
    if [ -L "$HOME/$dotfile" ]; then
      ln -sfn "$PWD/$dotfile" "$HOME/$dotfile"
    else
      ln -sn "$PWD/$dotfile" "$HOME/$dotfile"
    fi
  fi
done

if [ -d "$HOME/.vim/bundle/vundle" ]; then
  rm -rf ~/.vim/bundle/vundle
fi

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim -u ~/.vimrc.bundles +BundleInstall +qa
