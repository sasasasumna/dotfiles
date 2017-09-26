#!/bin/bash

echo 'Making symlinks...'
ln -sf ~/.dotfiles/zshenv ~/.zshenv
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/gemrc ~/.gemrc
ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/rubocop.yml ~/.rubocop.yml
ln -sf ~/.dotfiles/eslintrc.yml ~/.eslintrc.yml
ln -sf ~/.dotfiles/railsrc ~/.railsrc
ln -sf ~/.dotfiles/irbrc ~/.irbrc
ln -sf ~/.dotfiles/pryrc ~/.pryrc
ln -sf ~/.dotfiles/tmux.conf ~/tmux.conf
mkdir ~/.bundle
ln -sf ~/.dotfiles/bundleconfig ~/.bundle/config

touch ~/.secrets
source ~/.zshenv

if [ -f $ZSH/oh-my-zsh.sh ]; then
  echo 'oh-my-zsh detected, skipping installation'
else
  echo 'Installing oh-my-zsh...'
  git clone git@github.com:robbyrussell/oh-my-zsh $ZSH
fi

ZSHRC_PATH=$DOTFILES_DIR/zshrc-ubuntu

if command -v sw_vers > /dev/null; then
  echo 'macOS detected!'
  ZSHRC_PATH=$DOTFILES_DIR/zshrc-mac
  if command -v brew > /dev/null; then
    echo 'Homebrew detected, skipping installation'
  else
    echo 'Installing homebrew...'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  brew tap Homebrew/bundle
  echo 'Installing brews...'
  brew bundle
else
  echo 'Linux detected!'
  ln -sf ~/.dotfiles/fonts.conf ~/fonts.conf
  if command -v apt-get > /dev/null; then
    echo 'Installing packages with apt-get...'
    curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
    sudo apt-get install -y nodejs postgresql postgresql-contrib libpq-dev git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev build-essential redis-server exuberant-ctags zsh zsh-syntax-highlighting
  else
    echo "Unknown Linux detected, this script is designed only to work with Debian-based distributions with apt-get"
    echo "Exiting"
    exit 1
  fi
fi

if command -v rbenv > /dev/null; then
  echo 'rbenv detected, skipping installation...'
elif command -v sw_vers > /dev/null; then
  echo 'Skipping rbenv setup, brew did that for us'
else
  echo 'Setting up rbenv...'
  git clone git@github.com:rbenv/rbenv $RBENV_ROOT
  git clone git@github.com:rbenv/ruby-build $RBENV_ROOT/plugins/ruby-build
  git clone git@github.com:tpope/rbenv-ctags $RBENV_ROOT/plugins/rbenv-ctags
  git clone git@github.com:rkh/rbenv-update $RBENV_ROOT/plugins/rbenv-update
fi

ln -sf $ZSHRC_PATH ~/.zshrc
chsh -s "$(which zsh)"

RUBY_VERSION=`echo -n "$(head -1 ruby-version)"`
echo "Installing Ruby ${RUBY_VERSION}..."
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION

source ~/.dotfiles/aliases
_gempackages
_npmpackages

echo "!!!!"
echo "DONE"
echo "!!!!"
