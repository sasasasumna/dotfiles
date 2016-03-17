#!/bin/bash

ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.gemrc ~/.gemrc
ln -sf ~/.dotfiles/.vimrc ~/.vimrc

echo "Installing Homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install zsh zsh-completions zsh-syntax-highlighting
/usr/local/bin/zsh ~/.dotfiles/install-brews.sh
