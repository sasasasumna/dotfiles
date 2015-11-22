#!/bin/bash

ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.gemrc ~/.gemrc

echo "Installing Homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install zsh zsh-completions zsh-syntax-highlighting
echo "Homebrew and ZSH setup complete."
echo "Change your shell to /usr/local/bin/zsh, then install your brews"

