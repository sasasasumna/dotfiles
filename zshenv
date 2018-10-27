export DOTFILES_DIR="$HOME/.dotfiles"
export DEVELOPMENT_DIR="$HOME/Development"

# SDK directories
export RBENV_ROOT="$HOME/.rbenv"
export GOROOT="/usr/lib/go"
export GOPATH="$DEVELOPMENT_DIR/golang"
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
export EDITOR="vim"
export VIM_CONFIG="$HOME/.vim"
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
export ZSH="$HOME/.oh-my-zsh"
export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
export GPG_TTY=$(tty)
export TERMINAL=/usr/bin/kitty
export TERM=xterm-256color
export QT_QPA_PLATFORMTHEME="qt5ct"

# Wayland
#export CLUTTER_BACKEN=wayland
#export QT_QPA_PLATFORM=wayland-egl
#export SDL_VIDEODRIVER=wayland

export PATH="./bin:$HOME/bin:$HOME/.local/bin:$RBENV_ROOT/bin:$NODENV_ROOT/bin:$PYENV_ROOT/bin:$GOPATH/bin:$GOROOT/bin:/usr/local/bin:/usr/local/sbin:$PATH"

if command -v rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if command -v nodenv >/dev/null 2>&1; then
  eval "$(nodenv init -)"
fi

source $DOTFILES_DIR/aliases
source $HOME/.secrets

#eval `keychain --eval id_rsa`

