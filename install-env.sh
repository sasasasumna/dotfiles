#!/bin/bash

ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.zshenv ~/.zshenv
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.gemrc ~/.gemrc
ln -sf ~/.dotfiles/.vimrc ~/.vimrc

IS_OSX=`which sw_vers`

if $IS_OSX
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  brew install zsh zsh-completions zsh-syntax-highlighting
  /usr/local/bin/zsh ~/.dotfiles/install-brews.sh
else
  git clone git@github.com:robbyrussell/oh-my-zsh ~/.oh-my-zsh
  chsh
fi

