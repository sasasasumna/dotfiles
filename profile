export DOTFILES_DIR="$HOME/.dotfiles"
export DEVELOPMENT_DIR="$HOME/Development"

# SDK directories
export RBENV_ROOT="$HOME/.rbenv"
export GOPATH="$DEVELOPMENT_DIR/golang"
export GO111MODULE="on"
export PYENV_ROOT="$HOME/.pyenv"
export NODENV_ROOT="$HOME/.nodenv"

# Development options
export GOJI_ENV="development"
export LANG="en_US.UTF-8"
export RACK_ENV="development"
export RAILS_ENV="$RACK_ENV"
export SERVER_ENV="$RAILS_ENV"
export APP_ENV="$SERVER_ENV"
export TZ="America/Los_Angeles"

# System options
export ARCHFLAGS="-arch x86_64"
export EDITOR="nvim"
export VISUAL=$EDITOR
export VIM_CONFIG="$HOME/.vim"
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
export ZSH="$HOME/.oh-my-zsh"
export GPG_TTY=$(tty)

export PATH="$(yarn global bin):$HOME/bin:$HOME/.local/bin:$GOPATH/bin:$GOROOT/bin:/usr/local/bin:/usr/local/sbin:$HOME/.cargo/bin:$PATH"

if command -v rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

if command -v nodenv >/dev/null 2>&1; then
  eval "$(nodenv init -)"
fi

if command -v jenv >/dev/null 2>&1; then
  eval "$(jenv init -)"
fi

source $DOTFILES_DIR/aliases
source $HOME/.secrets

