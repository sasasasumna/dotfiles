#!/bin/bash

ln -sf ~/.dotfiles/.zshenv ~/.zshenv
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.gemrc ~/.gemrc
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.codeintel ~/.codeintel
ln -sf ~/.dotfiles/.rubocopy.yml ~/.rubocopy.yml
ln -sf ~/.dotfiles/.eslintrc.yml ~/.eslintrc.yml

touch ~/.secrets
source ~/.zshenv

git clone git@github.com:robbyrussell/oh-my-zsh $ZSH

IS_OSX=`which sw_vers`

if $IS_OSX
  ln -s $DOTFILES_DIR/.zshrc-mac ~/.zshrc
  /usr/local/bin/zsh $DOTFILES_DIR/install-brews.sh
else # assuming ubuntu
  ln -s $DOTFILES_DIR/.zshrc-ubuntu ~/.zshrc

fi

USER=`whoami`
sudo su -c "createuser -s $USER" postgres

git clone git://github.com/rbenv/rbenv $RBENV_ROOT
git clone git://github.com/rbenv/ruby-build $RBENV_ROOT/plugins/ruby-build
git clone git://github.com/tpope/rbenv-ctags $RBENV_ROOT/plugins/rbenv-ctags
git clone git://github.com/rkh/rbenv-update $RBENV_ROOT/plugins/rbenv-update
git clone git://github.com/rbenv/rbenv-vars $RBENV_ROOT/plugins/rbenv-vars
git clone git://github.com/nodenv/nodenv $NODENV_ROOT
git clone git://github.com/nodenv/node-build $NODENV_ROOT/plugins/node-build
git clone git://github.com/nodenv/nodenv-update $NODENV_ROOT/plugins/nodenv-update

echo "Setting up Ruby $RUBY_VERSION..."
rbenv rehash
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
rbenv rehash
gem install bundler rsense rubocop reek
rbenv rehash

echo "Setting up NodeJS $NODE_VERSION..."
nodenv rehash
nodenv install $NODE_VERSION
nodenv global $NODE_VERSION
nodenv rehash
npm -g install bower eslint jsonlint babel-eslint typescript typings
nodenv rehash
