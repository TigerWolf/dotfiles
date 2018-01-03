#!/usr/bin/env bash

# Install dependencies

curl -L git.io/antigen > antigen.zsh
git clone --depth 1 https://github.com/nightsense/nightshell ~/.nightshell

# Link symlinks
unlink ~/.zshrc > /dev/null 2>&1
unlink ~/.vimrc > /dev/null 2>&1

ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/vimrc ~/.vimrc

echo -en 'Files linked.';
