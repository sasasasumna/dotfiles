export DOTFILES_DIR="$HOME/.dotfiles"
export DEVELOPMENT_DIR="$HOME/Development"

# SDK directories

# Development options
export GOJI_ENV="development"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export RACK_ENV="development"
export RAILS_ENV="$RACK_ENV"
export SERVER_ENV="$RAILS_ENV"
export APP_ENV="$SERVER_ENV"
export TZ="America/Los_Angeles"

# System options
export EDITOR="nvim"
export VISUAL=$EDITOR
export VIM_CONFIG="$HOME/.vim"
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
export ZSH="$HOME/.oh-my-zsh"
export GPG_TTY=$(tty)

if command -v /opt/homebrew/bin/brew > /dev/null; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export PATH="$HOME/bin:$HOME/.local/bin:/opt/homebrew/opt/postgresql@15/bin:$GOPATH/bin:$GOROOT/bin:/usr/local/bin:/usr/local/sbin:$HOME/.cargo/bin:$PATH"

if command -v /opt/homebrew/bin/rbenv > /dev/null; then
  eval "$(/opt/homebrew/bin/rbenv init -)"
fi

if command -v /opt/homebrew/bin/pyenv > /dev/null 2>&1; then
  eval "$(pyenv init -)"
  #eval "$($PYENV_ROOT/bin/pyenv virtualenv-init -)"
fi

if command -v /opt/homebrew/bin/nodenv > /dev/null 2>&1; then
  eval "$(nodenv init -)"
fi

if command -v jenv > /dev/null 2>&1; then
  eval "$(jenv init -)"
fi

if command -v rustup > /dev/null 2>&1; then
  rustup completions zsh cargo > /tmp/completions && source /tmp/completions && rm /tmp/completions
  rustup completions zsh rustup > /tmp/completions && source /tmp/completions && rm /tmp/completions
fi

#export PATH="$(yarn global bin):$PATH"

source $HOME/.secrets
source $DOTFILES_DIR/aliases


ssh-remote-config() {
  infocmp -x | ssh -t $1 'cat > "$TERM.info" && tic -x "$TERM.info"'
}
