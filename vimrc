
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/adam/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/adam/.cache/dein')
  call dein#begin('/home/adam/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/adam/.cache/dein/repos/github.com/Shougo/dein.vim')

  " ide
  call dein#add('tpope/vim-projectionist')
  call dein#add('ludovicchabant/vim-gutentags')
  call dein#add('xolox/vim-misc')
  call dein#add('w0rp/ale')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-sensible')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('mileszs/ack.vim')
  call dein#add('fweep/vim-zsh-path-completion')
  "call dein#add('roxma/vim-hug-neovim-rpc')
  call dein#add('roxma/nvim-yarp')
  call dein#add('neomake/neomake')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('Shougo/deoplete.nvim')

  " ruby
  call dein#add('tpope/vim-rails.git')
  call dein#add('tpope/vim-rake.git')
  call dein#add('tpope/vim-bundler.git')
  call dein#add('tpope/vim-rbenv.git')
  "call dein#add('slim-template/vim-slim')
  call dein#add('tpope/vim-endwise')
  call dein#add('uplus/deoplete-solargraph')

  " javascript
  "call dein#add('mxw/vim-jsx')
  "call dein#add('pangloss/vim-javascript')
  call dein#add('carlitux/deoplete-ternjs')
  call dein#add('HerringtonDarkholme/yats.vim')

  " syntax
  "call dein#add('kchmck/vim-coffee-script')
  "call dein#add('tpope/vim-markdown')
  call dein#add('ap/vim-css-color')

  " golang
  "call dein#add('fatih/vim-go')
  call dein#add('zchee/deoplete-go', {'build': 'make'})

  " zsh
  call dein#add('zchee/deoplete-zsh')

  " colorschemes
  call dein#add('nanotech/jellybeans.vim')
  call dein#add('DanManN/vim-razer')
  call dein#add('fenetikm/falcon')
  call dein#add('joshdick/onedark.vim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

syntax on            " enable syntax highlighting

set bs=2                       " set backspace to 2 when removing whitespace
set clipboard=unnamed          " share system clipboard
"set cursorline                 " highlight current line
set directory=~/.vim/swp       " swap files go here
set encoding=utf8              " file encoding defaults to UTF8
set expandtab                  " expand tabs to spaces
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
set number                     " show line numbers
set regexpengine=1
set ruler                      " draw ruler
set shiftwidth=2               " indent by 2 spaces
set showtabline=0              " do not draw tabs
set sm                         " show matching braces
set smartcase                  " insensitive by default, switches to case sensitive when capital letters are typed
set softtabstop=2              " tab stops to 2 spaces
set synmaxcol=200
set title                      " change terminal title
set ttyfast                    " fast scrolling
set undolevels=1000            " undo history of 1000
set virtualedit=onemore        " put cursor one past end of visual block
set visualbell                 " enable visual bell

" ===============
" NeoVim language providers
" ===============
"let g:python3_host_prog = '~/.pyenv/versions/neovim-3.7.1/bin/python'
"let g:python_host_prog = '~/.pyenv/versions/neovim-2.7.15/bin/python'

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
"nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" ===============
" Deoplete
" ===============
let g:python3_host_skip_check = 1
let g:python3_host_prog = '/usr/bin/python'

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#auto_complete_delay = 300
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns['default'] = '\h\w*'
let g:deoplete#omni#input_patterns = {}
"call deoplete#custom#source('_', 'converters', ['converter_auto_paren', 'converter_auto_delimiter', 'converter_remove_overlap'])
imap <expr> <tab>   pumvisible() ? "\<c-n>" : "\<tab>"
imap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
set completeopt-=preview

let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#align_class = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#auto_goos = 1

let g:deoplete#sources#ternjs#tern_bin = $HOME.'/.nodenv/shims/tern'
let g:deoplete#sources#ternjs#filetypes = ['jsx', 'ts', 'tsx', 'typescript', 'js.jsx', 'javascript.jsx', 'es6', 'js.es6', 'vue', 'js.vue']

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
set guifont=Hack:h10
set gfn=Hack\ 10
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

" ===============
" Neomake Linters
" ===============
autocmd! BufWritePost * Neomake

let g:neomake_error_sign   = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '∆', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign    = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}
let g:neomake_go_gometalinter_maker = {
  \ 'args': [
  \   '--tests',
  \   '--enable-gc',
  \   '--concurrency=10',
  \   '--fast',
  \   '-D', 'aligncheck',
  \   '-D', 'dupl',
  \   '-D', 'gocyclo',
  \   '-D', 'gotype',
  \   '-E', 'errcheck',
  \   '-E', 'misspell',
  \   '-E', 'unused',
  \   '%:p:h',
  \ ],
  \ 'exec': '/home/adam/Development/golang/bin/gometalinter',
  \ 'append_file': 0,
  \ 'errorformat':
  \   '%E%f:%l:%c:%trror: %m,' .
  \   '%W%f:%l:%c:%tarning: %m,' .
  \   '%E%f:%l::%trror: %m,' .
  \   '%W%f:%l::%tarning: %m'
  \ }

let g:neomake_coffee_enabled_makers = ['coffeelint']
let g:neomake_cpp_enabled_makers = ['gcc']
let g:neomake_css_enabled_makers = ['stylelint']
"let g:neomake_dockerfile_enabled_makers = ['hadolint']
let g:neomake_go_enabled_makers = ['gometalinter']
let g:neomake_haml_enabled_makers = ['haml-lint']
let g:neomake_javascript_enabled_makers = ['eslint', 'stylelint']
let g:neomake_json_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = ['rubocop', 'reek']
let g:neomake_scss_enabled_makers = ['scsslint', 'stylelint']
let g:neomake_slim_enabled_makers = ['slimlint']
let g:neomake_sql_enabled_makers = ['sqlint']
let g:neomake_typescript_enabled_makers = ['tslint']


" ===============
" Gutentags
" ===============
set statusline+=%{gutentags#statusline()}

" ===============
" Vim-Go
" ===============
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = '/home/adam/Development/golang/bin/goimports'
let g:go_fmt_fail_silently = 1
let g:go_term_enabled = 1
autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
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

