set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'fweep/vim-zsh-path-completion'
Plugin 'nanotech/jellybeans.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'slim-template/vim-slim'
Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
filetype plugin on

let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_ruby_checkers = ['rubocop', 'reek']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set cursorline
set expandtab
set modelines=0
set shiftwidth=2
set clipboard=unnamed
set ttyfast
set ttyscroll=10
set encoding=utf-8
set tabstop=2
set nowrap
set number
set expandtab
set nowritebackup
set noswapfile
set nobackup
set ignorecase
set smartcase
set sm
set virtualedit=onemore

" remove trailing whitespace for only the following file extensions
autocmd FileType c,cpp,h,hpp,rb,js,jsx,pl,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e


if has("gui_running")
  set guioptions=
  syntax on
  set hlsearch
  colorscheme jellybeans
  set bs=2
  set ai
  set ruler
  set linespace=2
  set guifont=Inconsolata:h14
  let g:jellybeans_use_term_italics = 1
endif

