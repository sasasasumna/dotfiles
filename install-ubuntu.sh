sudo apt-get install -y postgresql postgresql-contrib libpq-dev git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev build-essential redis-server exuberant-ctags zsh zsh-syntax-highlighting

source ./.zshrc-ubuntu

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
npm -g install bower eslint jsonlint babel-eslint typescript
nodenv rehash

