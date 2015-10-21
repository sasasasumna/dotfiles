source ~/.secrets

export GOPATH=~/Development/go
export ANDROID_HOME=/usr/local/opt/android-sdk
export JAVA_HOME=`/usr/libexec/java_home`
export TZ="America/Los_Angeles"
export SIDEKIQ_WORKERS=10
export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export EDITOR='vim'
export ARCHFLAGS="-arch x86_64"
export SSH_KEY_PATH="~/.ssh/id_rsa"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
export PATH=$HOME/bin:/usr/local/share/npm/bin:~/.rbenv/shims:/usr/local/bin:/usr/local/sbin:/usr/bin:$GOPATH/bin:/usr/local/opt/go/libexec/bin:$PATH
export WEB_CONCURRENCY=1
export MAX_THREADS=1

ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=(/usr/local/share/zsh-completions $fpath)

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias be="bundle exec"
alias bef="bundle exec foreman start"
alias ber="bundle exec rails"
alias bern="bundle exec rails new"
alias berg="bundle exec rails g"
alias berd="bundle exec rails d"
alias berc="bundle exec rails c"
alias bek="bundle exec rake"
alias bekc="bundle exec rake db:create"
alias bekd="bundle exec rake db:drop"
alias bekm="bundle exec rake db:migrate"
alias bekt="bundle exec rake -T"
alias bekcm="bundle exec rake db:create && bundle exec rake db:migrate"
alias bekdcm="bundle exec rake db:drop && bundle exec rake db:create && bundle exec rake db:migrate"

alias goji-staging1="ssh -i ~/Development/gojilabs-staging.pem ubuntu@$GOJI_STAGING_1_EC2_DOMAIN"

