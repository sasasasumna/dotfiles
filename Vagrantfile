# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "devbox"
  config.vm.network "private_network", ip: "192.168.254.254"
  config.vm.network "public_network"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 4096
    vb.name = 'devbox'
    vb.cpus = 2
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
   
    echo "Updating packages..."
    sudo apt-get update
    echo "Autoremoving unnecessary packages..."
    sudo apt-get autoremove -y

    echo "Installing packages..."
    sudo apt-get install -y git libpq-dev git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libexpat1-dev libxml2-dev libxslt1-dev gettext unzip libcurl4-openssl-dev python-software-properties libffi-dev build-essential exuberant-ctags

    echo "Setting up git..."
    git config --global user.name 'Adam Sumner'
    git config --global user.email 'adamsumner@gmail.com'

    echo "Setting up SDK directory..."
    sudo mkdir -p /usr/local/var
    sudo chown -R ubuntu:ubuntu /usr/local/var

    echo "Setting up .gemrc..."
    echo 'install: --no-rdoc --no-ri' > ~/.gemrc
    echo 'update: --no-rdoc --no-ri' >> ~/.gemrc
    echo 'gem: --no-document' >> ~/.gemrc

    echo "Downloading version managers into SDK directories..."
    export RBENV_ROOT="/usr/local/var/rbenv"
    export NODENV_ROOT="/usr/local/var/nodenv"
    git clone git://github.com/rbenv/rbenv $RBENV_ROOT
    git clone git://github.com/rbenv/ruby-build $RBENV_ROOT/plugins/ruby-build
    git clone git://github.com/tpope/rbenv-ctags $RBENV_ROOT/plugins/rbenv-ctags
    git clone git://github.com/rbenv/rbenv-gem-rehash $RBENV_ROOT/plugins/rbenv-gem-rehash
    git clone git://github.com/rkh/rbenv-update $RBENV_ROOT/plugins/rbenv-update
    git clone git://github.com/rbenv/rbenv-vars $RBENV_ROOT/plugins/rbenv-vars
    git clone git://github.com/nodenv/nodenv $NODENV_ROOT
    git clone git://github.com/nodenv/node-build $NODENV_ROOT/plugins/node-build
    git clone git://github.com/nodenv/nodenv-package-rehash $NODENV_ROOT/plugins/nodenv-package-rehash
    git clone git://github.com/nodenv/nodenv-update $NODENV_ROOT/plugins/nodenv-update

    echo "Setting up .projects..."
    echo 'export RBENV_ROOT="/usr/local/var/rbenv"' > ~/.projects
    echo 'export NODENV_ROOT="/usr/local/var/nodenv"' >> ~/.projects
    echo 'export GOJI_ENV="development"' >> ~/.projects
    echo 'export LANG="en_US.UTF-8"' >> ~/.projects
    echo 'export RACK_ENV="development"' >> ~/.projects
    echo 'export RAILS_ENV="development"' >> ~/.projects
    echo 'export TZ="America/Los_Angeles"' >> ~/.projects
    echo 'export WEB_CONCURRENCY=1' >> ~/.projects
    echo 'export PATH="$NODENV_ROOT/bin:$RBENV_ROOT/bin:$PATH"' >> ~/.projects
    echo 'eval "$(nodenv init -)"' >> ~/.projects
    echo 'eval "$(rbenv  init -)"' >> ~/.projects
    echo 'source $HOME/.projects' >> ~/.bash_profile

    echo "Loading .projects..."
    source ~/.projects

    echo "Setting up Ruby..."
    rbenv install 2.4.0
    rbenv global 2.4.0
    gem update --system
    gem update
    gem clean
    gem install bundler

    echo "Setting up NodeJS..."
    nodenv install 7.3.0
    nodenv global 7.3.0
    npm -g update
    npm -g install eslint jsonlint babel-eslint typescript typings eslint-plugin-react ctags pug-cli webpack
  
    echo "DONE"
  SHELL
end
