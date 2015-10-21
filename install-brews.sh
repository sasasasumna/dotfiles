#! /usr/local/bin/zsh

# for install Brew: ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# assuming brew, zsh, zsh-completions, zsh-syntax-highlighting already installed!
brew update

brew install caskroom/cask/brew-cask
brew cask install xquartz
brew cleanup
brew cask cleanup

brew install apple-gcc42 --with-gfortran-symlink
brew install homebrew/dupes/tcl-tk --with-x11 --with-threads
brew install sqlite --with-dbstat --with-docs --with-fts --with-functions --with-icu4c --with-unlock-notify
brew install python3 --with-tcl-tk
brew install python --with-tcl-tk --with-berkeley-db4
brew install lua --with-completion
brew install little-cms --with-python
brew install perl --with-dtrace
brew install jbig2dec --with-libpng
brew install harfbuzz --with-cairo
brew install gtk+3 --with-jasper --with-quartz-relocation
brew install librsvg --with-gtk+3
brew install graphviz --with-freetype --with-librsvg --with-pango --with-x11 --with-app
brew install yasm --with-python
brew install gd --with-libvpx # has issue with El Capitan
brew install boost --with-c++11 --with-icu4c # has issue with El Capitan
brew install curl --with-c-ares --with-gssapi --with-libidn --with-libmetalink --with-nghttp2 --with-rtmpdump --with-libssh2 --with-openssl
brew install fftw --with-fortran --with-openmp
brew install ghostscript --with-x11 --with-djvu
brew install postgresql --with-dtrace --with-python
brew install subversion --with-java --with-perl --with-python --with-ruby --universal
brew install git --with-brewed-openssl --with-brewed-svn --with-blk-sha1 --with-brewed-curl --with-gettext --with-pcre --with-persistent-https
brew install go --with-cc-all
brew install imagemagick --with-fftw --with-fontconfig --with-ghostscript --with-hdri --with-jp2 --with-liblqr --with-librsvg --with-libwmf --with-little-cms --with-little-cms2 --with-openexr --with-openmp --with-pango --with-perl #issue on El Capitan
brew install node --with-icu4c --with-openssl
brew install homebrew/science/r --with-pango --with-x11 --with-openblas
brew install wget --with-iri --with-pcre
brew install vim --override-system-vi --with-python3 --with-tcl --with-lua --with-luajit
brew install libxml2 --with-python
brew install llvm --with-clang --with-python
brew install objective-caml --with-x11
brew install tomcat --with-fulldocs
brew install erlang --with-fop --with-native-libs
brew install nginx --with-gunzip --with-spdy --with-webdav

brew install ack cvs heroku-toolbelt json-c libyaml memcached mercurial mysql redis riak rbenv ruby-build rust elixir homebrew/versions/v8-315
brew cask install java android-studio ax88179 dropbox firefox gimp google-chrome google-drive google-earth google-earth-web-plugin google-hangouts inkscape hipchat iterm2 psequel skype slack steam sublime-text3 tunnelblick vagrant vagrant-manager virtualbox visual-studio-code vlc
