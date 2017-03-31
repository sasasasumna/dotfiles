export DOTFILES_DIR="$HOME/.dotfiles"
export DEVELOPMENT_DIR="$HOME/Development"

# SDK directories
export RBENV_ROOT="$HOME/.rbenv"
GO_PACKAGES="/usr/local/opt/go/packages"
GO_PROJECTS="$DEVELOPMENT_DIR/golang"
export GOPATH="$GO_PACKAGES:$GO_PROJECTS"

# Development options
export GOJI_ENV="development"
export LANG="en_US.UTF-8"
export RACK_ENV="development"
export RAILS_ENV="development"
export TZ="America/Los_Angeles"

# System options
export ARCHFLAGS="-arch x86_64"
export EDITOR="vim"
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
export ZSH="$HOME/.oh-my-zsh"

export PATH="$RBENV_ROOT/bin:/usr/local/bin:/usr/local/sbin:$PATH:$GOROOT/libexec/bin:$GOROOT/bin"

if command -v rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

export PATH="./bin:$GO_PROJECTS/bin:$GO_PACKAGES/bin:$PATH"

source $DOTFILES_DIR/aliases
source $HOME/.secrets

