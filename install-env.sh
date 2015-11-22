#!/bin/bash

export RBENV_ROOT=/usr/local/var/rbenv
export NODENV_ROOT=/usr/local/var/nodenv
export PATH=$RBENV_ROOT/shims:$NODENV_ROOT/shims:usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

echo "setenv RBENV_ROOT $RBENV_ROOT" > .launchdtempfile
echo "setenv EXENV_ROOT $EXENV_ROOT" >> .launchdtempfile
echo "setenv PATH $PATH" >> .launchdtempfile
echo "Password may be needed to install /etc/launchd.conf..."
sudo mv .launchdtempfile /etc/launchd.conf

ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.gemrc ~/.gemrc

echo "Installing Homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install zsh zsh-completions zsh-syntax-highlighting
echo "Homebrew and ZSH setup complete."
echo "Change your shell to /usr/local/bin/zsh, then install your brews"

