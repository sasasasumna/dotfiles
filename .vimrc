set cursorline
set expandtab
set modelines=0
set shiftwidth=2
set clipboard=unnamed
set ttyfast
set ttyscroll=10
set encoding=utf-8
set softtabstop=2
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
set hlsearch
set incsearch
set nocompatible
set bs=2
set nosmartindent
set nocindent
set hidden
set showtabline=0

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Ruby
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'slim-template/vim-slim'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Motion
Plugin 'justinmk/vim-sneak'

" Themes
Plugin 'nanotech/jellybeans.vim'

" Status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Fuzzy file finder
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'

Plugin 'fweep/vim-zsh-path-completion'
Plugin 'tpope/vim-surround'

" Linting, language-agnostic
Plugin 'scrooloose/syntastic'

" Javascript
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'

" Misc
Plugin 'tpope/vim-sensible'

" All of your Plugins must be added before the following line
call vundle#end()

colorscheme jellybeans

" Syntastic
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_ruby_checkers = ['reek', 'rubocop']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:javascript_enable_domhtmlcss = 1

" ===============
" CtrlP
" ===============
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" ===============
" ---------------
" ===============

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" remove trailing whitespace for only the following file extensions
autocmd FileType c autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType cpp autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType ruby autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType javascript autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType perl autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType java autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType php autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType go autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType rst autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType python autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType clojure autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType diff autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType erlang autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType elixir autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType json autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType grub autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType make autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType r autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType sass autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType scss autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType sh autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType sshconfig autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType sql autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType vim autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType zsh autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType xml autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType yaml autocmd BufWritePre <buffer> :%s/\s\+$//e

if has("gui_running")
  set guioptions=
  set linespace=2
  set guifont=Inconsolata:h14
  let g:jellybeans_use_term_italics = 1
endif

