brew cask install java6 java7

source ./.zshenv
source ./.zshrc

git clone git@github.com:rbenv/rbenv.git $RBENV_ROOT
git clone git@github.com:rbenv/ruby-build.git $RBENV_ROOT/plugins/ruby-build
git clone git@github.com:tpope/rbenv-ctags.git $RBENV_ROOT/plugins/rbenv-ctags
git clone git@github.com:rbenv/rbenv-vars.git $RBENV_ROOT/plugins/rbenv-vars
git clone git@github.com:rkh/rbenv-update.git $RBENV_ROOT/plugins/rbenv-update

rbenv init
rbenv install $RUBY
rbenv rehash
rbenv global $RUBY
gem update --system
gem update
rbenv rehash
gem clean
gem install bundler rsense rubocop reek
rbenv rehash

git clone git@github.com:nodenv/nodenv.git $NODENV_ROOT
git clone git@github.com:nodenv/node-build.git $NODENV_ROOT/plugins/node-build
git clone git@github.com:nodenv/nodenv-vars.git $NODENV_ROOT/plugins/nodenv-vars
git clone git@github.com:nodenv/nodenv-update.git $NODENV_ROOT/plugins/nodenv-update

nodenv init
nodenv install $NODE
nodenv rehash
nodenv global $NODE
npm -g update
nodenv rehash
npm -g install bower webpack eslint jsonlint babel-eslint typescript dockerlint
nodenv rehash

