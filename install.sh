#!/bin/bash

echo 'Making symlinks...'
mkdir ~/.bundle
mkdir -p ~/.bundle
mkdir -p ~/.config/i3
mkdir -p ~/.config/i3blocks
mkdir -p ~/.config/kitty
mkdir -p ~/.config/nvim
mkdir -p ~/.config/rofi

ln -sf ~/.dotfiles/aliases ~/.aliases
ln -sf ~/.dotfiles/bundleconfig ~/.bundle/config
ln -sf ~/.dotfiles/conkyrc ~/.conkyrc
ln -sf ~/.dotfiles/eslintrc.yml ~/.eslintrc.yml
ln -sf ~/.dotfiles/fonts.conf ~/fonts.conf
ln -sf ~/.dotfiles/gpg.conf ~/gpg.conf
ln -sf ~/.dotfiles/gpg-agent.conf ~/gpg-agent.conf
ln -sf ~/.dotfiles/gemrc ~/.gemrc
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/irbrc ~/.irbrc
ln -sf ~/.dotfiles/pryrc ~/.pryrc
ln -sf ~/.dotfiles/railsrc ~/.railsrc
ln -sf ~/.dotfiles/rubocop.yml ~/.rubocop.yml
ln -sf ~/.dotfiles/ruby-version ~/.ruby-version
ln -sf ~/.dotfiles/node-version ~/.node-version
ln -sf ~/.dotfiles/zshenv ~/.zshenv
ln -sf ~/.dotfiles/prettierrc ~/.prettierrc
ln -sf ~/.dotfiles/vimrc ~/.vimrc

ln -sf ~/.dotfiles/compton.conf ~/.config/compton.conf
ln -sf ~/.dotfiles/i3.conf ~/.config/i3/config
ln -sf ~/.dotfiles/rofi.conf ~/.config/rofi/config
ln -sf ~/.dotfiles/xprofile ~/.xprofile
ln -sf ~/.dotfiles/i3blocks.conf ~/.config/i3blocks/config
ln -sf ~/.dotfiles/kitty.conf ~/.config/kitty/
ln -sf ~/.dotfiles/vimrc ~/.config/nvim/init.vim

ln -s $PWD/bin ~/

touch ~/.secrets
source ~/.zshenv

if [ -f $ZSH/oh-my-zsh.sh ]; then
  echo 'oh-my-zsh detected, skipping installation'
else
  echo 'Installing oh-my-zsh...'
  git clone https://github.com/robbyrussell/oh-my-zsh $ZSH
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:$ZSH/custom}/plugins/zsh-syntax-highlighting
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
ln -sf $ZSHRC_PATH ~/.zshrc

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

NODE_VERSION=`echo -n "$(head -1 node-version)"`
echo "Installing Node ${NODE_VERSION}..."
nodenv install $NODE_VERSION
nodenv global $NODE_VERSION

echo "Installing delve for go debugging"
go get -u github.com/derekparker/delve/cmd/dlv

source ~/.dotfiles/aliases
_gempackages
_npmpackages

echo "!!!!"
echo "DONE"
echo "!!!!"
