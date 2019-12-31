syntax on            " enable syntax highlighting

set bs=2                       " set backspace to 2 when removing whitespace
set clipboard=unnamed          " share system clipboard
set cmdheight=2                " give messages one extra line to display
set cursorline                 " highlight current line
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
set nowritebackup
set number                     " show line numbers
set regexpengine=1
set ruler                      " draw ruler
set shiftwidth=2               " indent by 2 spaces
set shortmess+=c               " don't give |ins-completion-menu| messages.
set showtabline=0              " do not draw tabs
set signcolumn=yes             " always show signcolumns
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

function! CocSetup(info)
  " Initial setup
  call coc#util#install()

  " Install extensions on installation, update otherwise
  if a:info.status == 'installed' || a:info.force
    call coc#add_extension('coc-css', 'coc-emoji', 'coc-highlight', 'coc-html', 'coc-json', 'coc-prettier', 'coc-solargraph', 'coc-stylelint', 'coc-tsserver', 'coc-ultisnips', 'coc-yaml')
  else
    execute 'CocUpdateSync'
  endif
endfunction


" ======================================================================
" ===================== VimPlug Config =================================
" ======================================================================

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ciaranm/securemodelines'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/molokai'
Plug 'fatih/vim-go'
Plug 'liuchengxu/eleline.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': function('CocSetup')}
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rsi'

call plug#end()

" ======================================================================
" ================= END VimPlug Config =================================
" ======================================================================


" ======================================================================
" ===================== Molokai Config =================================
" ======================================================================
"
colorscheme molokai
let g:rehash256 = 1

" ======================================================================
" =================== END Molokai Config ===============================
" ======================================================================


" ======================================================================
" ====================== CtrlPConfig ===================================
" ======================================================================

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" ======================================================================
" ================== END CtrlPConfig ===================================
" ======================================================================


" ======================================================================
" ===================== Eleline Config =================================
" ======================================================================

let g:eleline_powerline_fonts = 1

" ======================================================================
" =================== END Eleline Config ===============================
" ======================================================================


" ======================================================================
" ===================== vim-go Config ==================================
" ======================================================================

let g:go_fmt_fail_silently = 1
let g:go_addtags_transform = "camelcase"
let g:go_metalinter_autosave = 1
let g:go_fmt_command = "goimports"

" ======================================================================
" =================== END vim-go Config ================================
" ======================================================================


"" ======================================================================
"" ===================== CoC Coqueror of Completion Config ==============
"" ======================================================================

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
command! -nargs=0 PrettierAsync :call CocAction('runCommand', 'prettier.formatFile')

augroup coc_setup
  autocmd!

  " Close preview window when completion is done
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

augroup automake
  autocmd!

  " COC handles auto-linting . Setup formatting via prettier
  autocmd BufWritePre *.js,*.json,*.ts Prettier
augroup END

" Trigger completion via same as omni-completion
inoremap <silent><expr> <C-x><C-o> coc#refresh()

nnoremap <silent> <leader>lk <Plug>(coc-action-doHover)

" Note: These do not work with `noremap`
nmap <leader>lc <Plug>(coc-references)
nmap <leader>ld <Plug>(coc-definition)
nmap <leader>li <Plug>(coc-implementation)
nmap <leader>lr <Plug>(coc-rename)
nmap <leader>ls <Plug>(coc-documentSymbols)
nmap <leader>lt <Plug>(coc-type-definition)

vmap <leader>lf <Plug>(coc-format-selected)
nmap <leader>lf <Plug>(coc-format-selected)

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Navigation snippet sections with C-j/k
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

"" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
"" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"
"" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction
"
"" Highlight symbol under cursor on CursorHold
""autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)
"
"" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"
"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"
"" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"
"" Remap for do codeAction of current line
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Fix autofix problem of current line
"nmap <leader>qf  <Plug>(coc-fix-current)
"
"" Create mappings for function text object, requires document symbols feature of languageserver.
"xmap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap if <Plug>(coc-funcobj-i)
"omap af <Plug>(coc-funcobj-a)
"
""" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
""nmap <silent> <C-d> <Plug>(coc-range-select)
""xmap <silent> <C-d> <Plug>(coc-range-select)
"
"" Use `:Format` to format current buffer
"command! -nargs=0 Format :call CocAction('format')
"
"" Use `:Fold` to fold current buffer
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"" use `:OR` for organize import of current buffer
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"" ======================================================================
"" ================= END CoC Coqueror of Completion Config ==============
"" ======================================================================
