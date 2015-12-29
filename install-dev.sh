brew cask install java6 java7
jenv init
for i in `ls /Library/Java/JavaVirtualMachines`
do
  echo "Adding /Library/Java/JavaVirtualMachines/${i}/Contents/Home..."
  jenv add /Library/Java/JavaVirtualMachines/${i}/Contents/Home
done

brew install rbenv ruby-build
rbenv init
rbenv install $RUBY
rbenv rehash
rbenv global $RUBY
gem update --system
gem update
rbenv rehash
gem clean
gem install bundler
rbenv rehash

brew install nodenv node-build
nodenv init
nodenv install $NODE
nodenv rehash
nodenv global $NODE
npm -g update
nodenv rehash
npm -g install bower
nodenv rehash

brew install exenv elixir-build
exenv init
exenv install $ELIXIR
exenv rehash
exenv global $ELIXIR

brew install pyenv python-build
pyenv init
pyenv install $PYTHON2
pyenv install $PYTHON3
pyenv rehash
pyenv global $PYTHON2
