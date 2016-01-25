#! /usr/local/bin/zsh

# for install Brew: ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# assuming brew, zsh, zsh-completions, zsh-syntax-highlighting already installed!

brew tap homebrew/dupes
brew tap homebrew/science
brew tap homebrew/versions
brew tap caskroom/cask
brew tap caskroom/versions

brew update

brew install caskroom/cask/brew-cask openssl subversion libxml2 json-c xz pkg-config
brew cask install xquartz java

brew install gtk+ --with-jasper
brew install gtk+3 --with-jasper --with-quartz-relocation
brew install gnupg2 --with-readline
brew install tcl-tk --with-x11 --with-threads
brew install sqlite --with-dbstat --with-docs --with-fts --with-functions --with-icu4c --with-unlock-notify
brew install lua --with-completion
brew install jbig2dec --with-libpng
brew install harfbuzz --with-cairo
brew install librsvg --with-gtk+3
brew install graphviz --with-freetype --with-librsvg --with-pango --with-x11 --with-app
brew install gd --with-libvpx
brew install boost --with-c++11 --with-icu4c
brew install curl --with-c-ares --with-gssapi --with-libidn --with-libmetalink --with-nghttp2 --with-rtmpdump --with-libssh2 --with-openssl
brew install fftw --with-fortran --with-openmp
brew install ghostscript --with-x11 --with-djvu
brew install git --with-brewed-openssl --with-brewed-svn --with-blk-sha1 --with-brewed-curl --with-gettext --with-pcre --with-persistent-https
brew install imagemagick --with-fftw --with-fontconfig --with-ghostscript --with-hdri --with-jp2 --with-liblqr --with-librsvg --with-libwmf --with-little-cms --with-little-cms2 --with-openexr --with-pango --with-perl
brew install homebrew/science/r --with-pango --with-x11 --with-openblas
brew install wget --with-iri --with-pcre
brew install vim --override-system-vi
brew install objective-caml --with-x11
brew install erlang --with-fop --with-native-libs --without-hipe --without-docs
brew install nginx --with-gunzip --with-spdy --with-webdav

brew install ack cassandra cvs heroku-toolbelt json-c libyaml memcached mercurial mysql postgresql redis riak v8
brew cask install android-studio ax88179 firefox gimp google-chrome google-drive google-earth google-earth-web-plugin google-hangouts inkscape hipchat iterm2 psequel skype slack steam sublime-text3 tunnelblick vlc

