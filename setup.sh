#!/usr/bin/env bash
unlink ~/.zshrc > /dev/null 2>&1
unlink ~/.vimrc > /dev/null 2>&1

ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/vimrc ~/.vimrc

echo -en 'Files linked.';
