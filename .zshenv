source ~/.secrets

# SDK directories
export ANDROID_HOME=/usr/local/opt/android-sdk
export EXENV_ROOT=/usr/local/var/exenv
export JENV_ROOT=/usr/local/var/jenv
export NODENV_ROOT=/usr/local/var/nodenv
export PYENV_ROOT=/usr/local/var/pyenv
export RBENV_ROOT=/usr/local/var/rbenv

# Development options
export GOJI_ENV=development
export LANG=en_US.UTF-8
export RACK_ENV=development
export RAILS_ENV=development
export TZ="America/Los_Angeles"
export WEB_CONCURRENCY=1
export GOPATH=$HOME/Development/golang

# System options
export ARCHFLAGS="-arch x86_64"
export EDITOR=vim
export SSH_KEY_PATH=$HOME/.ssh/id_rsa

export PATH="$EXENV_ROOT/shims:$JENV_ROOT/shims:$NODENV_ROOT/shims:$PYENV_ROOT/shims:$RBENV_ROOT/shims:/usr/local/bin:/usr/local/sbin:$PATH"

