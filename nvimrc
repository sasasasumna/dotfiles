
filetype plugin indent on
syntax enable

syntax on                      " enable syntax highlighting

set bs=2                       " set backspace to 2 when removing whitespace
set clipboard+=unnamedplus     " share system clipboard
set cmdheight=2
set completeopt=menuone,noselect
set cursorline                 " highlight current line
set directory=~/.vim/swp       " swap files go here
set encoding=utf8              " file encoding defaults to UTF8
set expandtab                  " expand tabs to spaces
set gfn=Hack\ 12
set go+=a                      " Visual selection automatically copied to the clipboard
set guifont=Hack:h12
set guioptions=
set hidden                     " hide buffers instead of closing them
set history=1000               " command history of 1000
set hlsearch                   " highlight search terms
set incsearch                  " incremental search
set laststatus=2               " always display status line
set lazyredraw                 " buffer redraws instead of drawing each one
set linespace=2
set modelines=0                " never prepend vim config line to file
set mouse=a
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
set showmatch
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
set wildmode=longest,list

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"colorscheme default

nmap <C-CR> <Plug>(fullscreen-toggle)

vmap <LeftRelease> "*ygv
if &term =~ '256color'
  set t_ut=
endif

if (has("termguicolors"))
  set termguicolors
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" ===============
" Filetype assignments
" ===============
au BufNewFile,BufRead *.dump set filetype=sql
au BufNewFile,BufRead *.es6 set filetype=javascript
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript



call plug#begin(stdpath('data') . '/plugged')
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

  " autocomplete
  Plug 'hrsh7th/nvim-compe'

  " language servers
  Plug 'neovim/nvim-lspconfig'
  Plug 'kabouzeid/nvim-lspinstall'

"  " Golang
"  Plug 'fatih/vim-go'
"
"  " Ruby
"  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-rbenv'
"  Plug 'vim-ruby/vim-ruby'
  Plug 'slim-template/vim-slim'
"
"  " Javascript/Typescript
"  Plug 'HerringtonDarkholme/yats'
"
"  " configuration
"  Plug 'tpope/vim-endwise'
"  Plug 'ludovicchabant/vim-gutentags'
"  Plug 'tpope/vim-sensible'
"
"  "Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
"  Plug 'vim-syntastic/syntastic'
"  Plug 'ycm-core/YouCompleteMe'
call plug#end()

colorscheme onedark
let g:airline_theme = 'onedark'
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256


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


" ===============
" Compe Autocomplete
" ===============
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

lua <<EOF
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn['vsnip#available'](1) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF


" ===============
" Language Servers
" ===============

" lsp-auto-install config
lua <<EOF
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
EOF


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




" ===============
" File extension / type associations
" ===============


"" ===============
"" Airline
"" ===============
"let g:airline_powerline_fonts = 1
"
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
"
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
"let g:airline#extensions#ale#enabled = 1
"
"
"" ===============
"" Gutentags
"" ===============
"set statusline+=%{gutentags#statusline()}
"
"
"" ===============
"" uyntastic
"" ===============
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"
"
"" ===============
"" Vim-Go
"" ===============
"let g:go_def_mapping_enabled = 0
"let g:go_fmt_command = '~/Development/golang/bin/goimports'
"let g:go_fmt_fail_silently = 0
"let g:go_term_enabled = 1
"autocmd FileType go setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab
"autocmd FileType go nmap <buffer> <leader>r <plug>(go-run)
"autocmd FileType go nmap <buffer> <leader>b <plug>(go-build)
"autocmd FileType go nmap <buffer> <leader>t <plug>(go-test)
"autocmd FileType go nmap <buffer> <leader>e <plug>(go-rename)
"autocmd FileType go nmap <buffer> gd <plug>(go-def-vertical)
"autocmd FileType go nmap <buffer> <c-]> <plug>(go-def-vertical)
"autocmd FileType go nmap <buffer> <leader>i <plug>(go-info)


