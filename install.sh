#!/bin/bash

echo 'Making symlinks...'
mkdir -p ~/.bundle
mkdir -p ~/.config/nvim
mkdir -p ~/.config/coc
mkdir -p ~/.config/yarn/global
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/ghostty
mkdir -p ~/.config/Cursor/User
mkdir -p ~/.zfunc
mkdir -p ~/.ssh

ln -sf ~/.dotfiles/aliases ~/.aliases
ln -sf ~/.dotfiles/bundleconfig ~/.bundle/config
ln -sf ~/.dotfiles/eslintrc.yml ~/.eslintrc.yml
ln -sf ~/.dotfiles/gpg.conf ~/gpg.conf
ln -sf ~/.dotfiles/gpg-agent.conf ~/gpg-agent.conf
ln -sf ~/.dotfiles/gemrc ~/.gemrc
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/irbrc ~/.irbrc
ln -sf ~/.dotfiles/pryrc ~/.pryrc
ln -sf ~/.dotfiles/railsrc ~/.railsrc
ln -sf ~/.dotfiles/rubocop.yml ~/.rubocop.yml
ln -sf ~/.dotfiles/.ruby-version ~/.ruby-version
ln -sf ~/.dotfiles/.node-version ~/.node-version
ln -sf ~/.dotfiles/prettierrc ~/.prettierrc
ln -sf ~/.dotfiles/gemspec ~/.gemspec
ln -sf ~/.dotfiles/sshconfig ~/.ssh/config
ln -sf ~/.dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -sf ~/.dotfiles/ghostty ~/.config/ghotty/config
ln -sf ~/.dotfiles/cursor.json ~/.config/Cursor/User/settings.json


ln -sf ~/.dotfiles/vimrc ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/erdconfig ~/.erdconfig
ln -sf ~/.dotfiles/glrnvim.yml ~/.config/glrnvim.yml
ln -sf ~/.dotfiles/coc-settings.json ~/.config/coc/
ln -sf ~/.dotfiles/package.json ~/.config/yarn/global/
ln -sf ~/.dotfiles/zed.settings.json ~/.config/zed/settings.json

rm -f ~/.bash_profile
ln -sf ~/.dotfiles/zshrc-common ~/.zshrc
ln -sf ~/.dotfiles/profile ~/.profile
mkdir -p ~/.config/plasma-workspace/env
ln -sf ~/.dotfiles/profile ~/.config/plasma-workspace/env/profile.sh

ln -s $PWD/bin ~/

touch ~/.secrets

if [ -f $ZSH/oh-my-zsh.sh ]; then
  echo 'oh-my-zsh detected, skipping installation'
else
  echo 'Installing oh-my-zsh...'
  git clone https://github.com/robbyrussell/oh-my-zsh $ZSH
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:$ZSH/custom}/plugins/zsh-syntax-highlighting
fi

if command -v sw_vers > /dev/null; then
  echo 'macOS detected!'
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
#{  ln -sf ~/.dotfiles/fonts.conf ~/fonts.conf
#{  if command -v apt-get > /dev/null; then
#{    echo 'Installing packages with apt-get...'
#{    curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
#{    sudo apt-get install -y nodejs postgresql postgresql-contrib libpq-dev git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev build-essential redis-server exuberant-ctags zsh zsh-syntax-highlighting
#{  else
#{    echo "Unknown Linux detected, this script is designed only to work with Debian-based distributions with apt-get"
#{    echo "Exiting"
#{    exit 1
#{  fi
fi

git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
cp ~/.tmux/.tmux.conf.local ~

if command -v $RBENV_ROOT/bin/rbenv > /dev/null; then
  echo 'rbenv detected, skipping installation...'
elif command -v sw_vers > /dev/null; then
  echo 'Skipping rbenv setup, brew did that for us'
else
  echo 'Setting up rbenv...'
  git clone https://github.com/rbenv/rbenv $RBENV_ROOT
  git clone https://github.com/rbenv/ruby-build $RBENV_ROOT/plugins/ruby-build
  git clone https://github.com/tpope/rbenv-ctags $RBENV_ROOT/plugins/rbenv-ctags
fi

if command -v $NODENV_ROOT/bin/nodenv > /dev/null; then
  echo 'nodenv detected, skipping installation...'
else
  echo 'Setting up nodenv...'
  git clone https://github.com/nodenv/nodenv $NODENV_ROOT
  git clone https://github.com/nodenv/node-build.git $NODENV_ROOT/plugins/node-build
fi

ZSH_EXEC="$(which zsh)"
if grep --quiet $ZSH_EXEC /etc/shells; then
  echo "$ZSH_EXEC has already been added to /etc/shells"
else
  echo "Adding zsh to /etc/shells"
  echo $ZSH_EXEC | sudo tee --append /etc/shells > /dev/null
fi
chsh -s $ZSH_EXEC

RUBY_VERSION=`echo -n "$(head -1 ruby-version)"`
echo "Installing Ruby ${RUBY_VERSION}..."
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
rbenv rehash
gem update --system
gem update
gem clean
gem install bundler
rbenv rehash
bundle install --system
rbenv rehash

NODE_VERSION=`echo -n "$(head -1 node-version)"`
echo "Installing Node ${NODE_VERSION}..."
nodenv install $NODE_VERSION
nodenv global $NODE_VERSION
nodenv rehash
npm update
nodenv rehash
npm install -g yarn@latest
nodenv rehash
yarn global upgrade
nodenv rehash

echo "Installing delve for go debugging"
go get -u github.com/derekparker/delve/cmd/dlv

source ~/.dotfiles/aliases

# Setup Plug for NVIM
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "!!!!"
echo "DONE"
echo "!!!!"
