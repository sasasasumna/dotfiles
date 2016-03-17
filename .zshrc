source ~/.zshenv

# ZSH options
export ZSH=$HOME/.oh-my-zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=(/usr/local/share/zsh-completions $fpath)
source /usr/local/share/zsh/site-functions/_aws

# Initialize SDK version managers
if which exenv  > /dev/null; then eval "$(exenv  init -)"; fi
if which jenv   > /dev/null; then eval "$(jenv   init -)"; fi
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi
if which pyenv  > /dev/null; then eval "$(pyenv  init -)"; fi
if which rbenv  > /dev/null; then eval "$(rbenv  init -)"; fi

# Ruby development aliases
alias bep="be puma -C config/puma.rb"
alias be="bundle exec"
alias ber="be rails"
alias bern="ber new"
alias berg="ber g"
alias berd="ber d"
alias berc="ber c"
alias bek="be rake"
alias bekt="bek -T"
alias bekc="bek db:create"
alias bekd="bek db:drop"
alias bekm="bek db:migrate"
alias bekcm="bekc && bekm"
alias bekdc="bekd && bekc"
alias bekdcm="bekdc && bekm"
alias beks="bek db:seed"
alias bekms="bekm && beks"
alias bekcms="bekc && bekms"
alias bekdcms="bekd && bekcms"

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

