#!/bin/bash

export RBENV_ROOT=/usr/local/var/rbenv
export EXENV_ROOT=/usr/local/var/exenv
export PATH=/usr/local/var/rbenv/shims:/usr/local/var/exenv/shims:/usr/local/share/npm/bin:/usr/local/opt/go/libexec/bin/:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

echo "Setting up basic path in /etc/launchd.conf"
echo "setenv RBENV_ROOT $RBENV_ROOT" > .launchdtempfile
echo "setenv EXENV_ROOT $EXENV_ROOT" >> .launchdtempfile
echo "setenv PATH $PATH" >> .launchdtempfile
echo "Password needed to install /etc/launchd.conf..."
sudo mv .launchdtempfile /etc/launchd.conf

ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.gemrc ~/.gemrc

echo "Installing Homebrew..."
#ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install zsh zsh-completions zsh-syntax-highlighting
echo "Homebrew and ZSH setup complete."
echo "Change your shell to /usr/local/bin/zsh, then install your brews"

