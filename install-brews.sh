#! /usr/local/bin/zsh

# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/reinstall/master/install)"
# assuming brew, zsh, zsh-completions, zsh-syntax-highlighting already installed!
brew update

# brew reinstall caskroom/cask/brew-cask
# brew cask reinstall xquartz
brew cleanup
brew cask cleanup

brew reinstall apple-gcc42 --with-gfortran-symlink
brew reinstall homebrew/dupes/tcl-tk --with-x11 --with-threads
brew reinstall python3 --with-tcl-tk
brew reinstall python --with-tcl-tk --with-berkeley-db4
brew reinstall lua --with-completion
brew reinstall little-cms --with-python
brew reinstall perl --with-dtrace
brew reinstall jbig2dec --with-libpng
brew reinstall harfbuzz --with-cairo
brew reinstall gtk+3 --with-jasper --with-quartz-relocation
brew reinstall librsvg --with-gtk+3
brew reinstall graphviz --with-freetype --with-librsvg --with-pango --with-x11 --with-app
brew reinstall gd --with-libvpx
brew reinstall open-mpi --c++11 --with-mpi-thread-multiple
brew reinstall boost --with-c++11 --with-icu4c --with-mpi
brew reinstall curl --with-c-ares --with-gssapi --with-libidn --with-libmetalink --with-nghttp2 --with-rtmpdump --with-libssh2 --with-openssl
brew reinstall fftw --with-fortran --with-mpi --with-openmp
brew reinstall ghostscript --with-x11 --with-djvu
brew reinstall postgresql --with-dtrace --with-python
brew reinstall sqlite --with-dbstat --with-docs --with-fts --with-functions --with-icu4c --with-unlock-notify
brew reinstall subversion --with-java --with-perl --with-python --with-ruby
brew reinstall git --with-brewed-openssl --with-brewed-svn --with-blk-sha1 --with-brewed-curl --with-gettext --with-pcre --with-persistent-https
brew reinstall go --with-cc-all
brew reinstall imagemagick --with-fftw --with-fontconfig --with-ghostscript --with-hdri --with-jp2 --with-liblqr --with-librsvg --with-libwmf --with-little-cms --with-little-cms2 --with-openexr --with-openmp --with-pango --with-perl
brew reinstall node --with-icu4c --with-openssl
brew reinstall homebrew/science/r --with-pango --with-valgrind --with-x11 --with-openblas --with-valgrind
brew reinstall wget --with-iri --with-pcre
brew reinstall vim --override-system-vi --with-python3 --with-tcl --with-lua --with-luajit
brew reinstall libxml2 --with-python
brew reinstall llvm --with-clang --with-lld --with-lldb --with-python --with-rtti
brew reinstall objective-caml --with-x11
brew reinstall tomcat --with-fulldocs
brew reinstall homebrew/versions/v8-315

brew reinstall ack cvs heroku-toolbelt json-c libyaml memcached mercurial mysql redis riak rbenv ruby-build
# brew cask reinstall java dropbox firefox gimp google-chrome google-drive google-earth google-earth-web-plugin google-hangouts inkscape hipchat iterm2 psequel skype slack steam sublime-text3 tunnelblick vagrant vagrant-manager virtualbox visual-studio-code vlc
