
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

filetype plugin indent on
syntax enable

syntax on                      " enable syntax highlighting

set bs=2                       " set backspace to 2 when removing whitespace
set clipboard+=unnamedplus     " share system clipboard
set cmdheight=2
set cursorline                 " highlight current line
set directory=~/.vim/swp       " swap files go here
set encoding=utf8              " file encoding defaults to UTF8
set expandtab                  " expand tabs to spaces
set go+=a                      " Visual selection automatically copied to the clipboard
set hidden                     " hide buffers instead of closing them
set history=1000               " command history of 1000
set hlsearch                   " highlight search terms
set incsearch                  " incremental search
set laststatus=2               " always display status line
set lazyredraw                 " buffer redraws instead of drawing each one
set modelines=0                " never prepend vim config line to file
set nobackup                   " disable backups
set nocompatible               " disable backward compatibility with Vi
set nocindent                  " disable indentation for C-style languages
set noerrorbells               " disable audio bell
set noshowcmd
set nosmartindent              " smart indentations get in the way
set nowrap                     " disable line wrapping
set nowritebackup
set number                     " show line numbers
set paste                      " Paste from a windows or from vim
set regexpengine=1
set ruler                      " draw ruler
set shiftwidth=2               " indent by 2 spaces
set shortmess+=c
set showtabline=0              " do not draw tabs
set signcolumn=number
set sm                         " show matching braces
set smartcase                  " insensitive by default, switches to case sensitive when capital letters are typed
set softtabstop=2              " tab stops to 2 spaces
set synmaxcol=200
set title                      " change terminal title
set ttyfast                    " fast scrolling
set undolevels=1000            " undo history of 1000
set updatetime=300
set virtualedit=onemore        " put cursor one past end of visual block
set visualbell                 " enable visual bell



call plug#begin()
  " color scheme
  Plug 'joshdick/onedark.vim'

  " layout
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " navigation
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'fweep/vim-zsh-path-completion'

  " Golang
  Plug 'fatih/vim-go'

  " Ruby
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-rbenv'
  Plug 'vim-ruby/vim-ruby'
  Plug 'slim-template/vim-slim'

  " Javascript/Typescript
  Plug 'HerringtonDarkholme/yats'

  " configuration
  Plug 'tpope/vim-endwise'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'tpope/vim-sensible'

  "Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
  Plug 'vim-syntastic/syntastic'
  Plug 'ycm-core/YouCompleteMe'
call plug#end()


"" ===============
"" NERDTree
"" ===============
let NERDTreeShowHidden=1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>


" ===============
" Git Gutter
" ===============
let g:gitgutter_grep_command = 'rg --hidden --follow --glob "!.git/*"'
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

" What is this?
let g:javascript_enable_domhtmlcss = 1


" ===============
" CtrlP
" ===============
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif


" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>


" ===============
" Remove trailing spaces
" ===============
if has('nvim')
else
  autocmd FileType c autocmd BufWritePre <buffer> :%s/\s\+$//e
  autocmd FileType cpp autocmd BufWritePre <buffer> :%s/\s\+$//e
  autocmd FileType ruby autocmd BufWritePre <buffer> :%s/\s\+$//e
  autocmd FileType javascript autocmd BufWritePre <buffer> :%s/\s\+$//e
  autocmd FileType typescript autocmd BufWritePre <buffer> :%s/\s\+$//e
  autocmd FileType javascript.jsx autocmd BufWritePre <buffer> :%s/\s\+$//e
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
endif


" ===============
" GUI options
" ===============
if (has("termguicolors"))
  set termguicolors
endif

let g:airline_theme = 'onedark'
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256
colorscheme onedark
nmap <C-CR> <Plug>(fullscreen-toggle)

set guioptions=
set linespace=2
set guifont=Hack:h12
set mouse=a
vmap <LeftRelease> "*ygv
set gfn=Hack\ 12
if &term =~ '256color'
  set t_ut=
endif

if has("nvim")
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
else
  set guiheadroom=0
endif


" ===============
" File extension / type associations
" ===============
au BufNewFile,BufRead *.es6 set filetype=javascript
au BufNewFile,BufRead *.dump set filetype=sql


" ===============
" Airline
" ===============
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#ale#enabled = 1


" ===============
" Gutentags
" ===============
set statusline+=%{gutentags#statusline()}


" ===============
" uyntastic
" ===============
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" ===============
" Vim-Go
" ===============
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = '~/Development/golang/bin/goimports'
let g:go_fmt_fail_silently = 0
let g:go_term_enabled = 1
autocmd FileType go setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab
autocmd FileType go nmap <buffer> <leader>r <plug>(go-run)
autocmd FileType go nmap <buffer> <leader>b <plug>(go-build)
autocmd FileType go nmap <buffer> <leader>t <plug>(go-test)
autocmd FileType go nmap <buffer> <leader>e <plug>(go-rename)
autocmd FileType go nmap <buffer> gd <plug>(go-def-vertical)
autocmd FileType go nmap <buffer> <c-]> <plug>(go-def-vertical)
autocmd FileType go nmap <buffer> <leader>i <plug>(go-info)


" ===============
" Filetype assignments
" ===============
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript
