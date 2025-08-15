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
export TZ="America/New_York"
export RUBY_YJIT_ENABLE=1
export DISABLE_SPRING=true

# System options
export EDITOR="vim"
export VISUAL=$EDITOR
export VIM_CONFIG="$HOME/.vim"
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
export ZSH="$HOME/.oh-my-zsh"
export GPG_TTY=$(tty)

if command -v /opt/homebrew/bin/brew > /dev/null; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export SPACES_ACCESS_KEY_ID="DO006GU8R37WR2G68U6V"

export PATH="$HOME/bin:$HOME/.nodenv/bin:$HOME/.rbenv/bin:$HOME/.local/bin:$GOPATH/bin:$GOROOT/bin:/usr/local/bin:/usr/local/sbin:$HOME/.cargo/bin:$PATH"

if command -v rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

if command -v pyenv > /dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if command -v nodenv > /dev/null 2>&1; then
  eval "$(nodenv init -)"
fi

if command -v jenv > /dev/null 2>&1; then
  eval "$(jenv init -)"
fi

if command -v rustup > /dev/null 2>&1; then
  rustup completions zsh cargo > /tmp/completions && source /tmp/completions && rm /tmp/completions
  rustup completions zsh rustup > /tmp/completions && source /tmp/completions && rm /tmp/completions
fi

if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi


#export PATH="$(yarn global bin):$PATH"

source $HOME/.secrets
source $DOTFILES_DIR/aliases


ssh-remote-config() {
  infocmp -x | ssh -t $1 'cat > "$TERM.info" && tic -x "$TERM.info"'
}

rand64() {
  ruby -e "require 'securerandom'; print SecureRandom.base64($1)"
}

secret64() {
  SECRET=$(rand64 $1)
  echo "RAW: $SECRET"
  echo "ENC: $(echo $SECRET | base64)"
}

