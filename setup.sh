#!/usr/bin/env bash

# Install dependencies
curl -L git.io/antigen > antigen.zsh

# Link symlinks
unlink ~/.zshrc > /dev/null 2>&1
unlink ~/.vimrc > /dev/null 2>&1

ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/vimrc ~/.vimrc

case `uname` in
  Darwin)
    # commands for OS X go here
    # Brew
    which -s brew
    if [[ $? != 0 ]] ; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      brew bundle
    else
      brew update
    fi
  ;;
  Linux)
    # commands for Linux go here
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac

# Open iTerm2
p10k configure

echo -en 'Files linked.';
