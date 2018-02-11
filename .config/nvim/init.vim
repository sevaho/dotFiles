" -----------------------------------------------------------------------------------------------------------------------------
" SEVAHO DOTFILES
" -----------------------------------------------------------------------------------------------------------------------------
"
" author: Sebastiaan Van Hoecke
" mail: sebastiaan@sevaho.io
"
" -----------------------------------------------------------------------------------------------------------------------------

" -----------------------------------------------------------------------------------------------------------------------------
" KEY BINDS / MAPPINGS
" -----------------------------------------------------------------------------------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')

	Plug 'vim-airline/vim-airline'                                      " airline
	Plug 'vim-airline/vim-airline-themes'                               " airline themes

	Plug 'scrooloose/nerdtree'                                          " nerdtree
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                      " nerdtree colors
	Plug 'Xuyuanp/nerdtree-git-plugin'                                  " nerdtree git

    Plug 'majutsushi/tagbar'                                            

    Plug 'qpkorr/vim-bufkill'

    Plug 'PProvost/vim-ps1'                                             " powershell syntax colors
    Plug 'lervag/vimtex'                                                " tex syntax colors
    Plug 'jwalton512/vim-blade'                                         " blade syntax colors

    Plug 'tomtom/tcomment_vim'                                          " commenting with g <

    Plug 'alvan/vim-closetag'                                           " autoclose html tags

    Plug 'w0rp/ale'                                                     " linting flake8 for python

    Plug 'dikiaap/minimalist'                                           " theme
    Plug 'mhinz/vim-signify'                                            " vcs tracker for Fossil fe.
    Plug 'mhinz/vim-startify'                                           " nice start page

    Plug 'Yggdroot/indentLine'                                          " indent
    Plug 'airblade/vim-gitgutter'                                       " gitgutter

    Plug 'Shougo/neosnippet'                                            " snippets

    Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }                     " smart way to handle buffers and windows on deletion
    Plug 'donRaphaco/neotex', { 'for': 'tex' }                          " live edit tex files

    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    Plug 'zchee/deoplete-jedi'                                          " autocomplete python
    Plug 'zchee/deoplete-clang'                                         " autocomplete C / C++
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }    " autocomplete js 
    Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install' }
    Plug 'zchee/deoplete-go', { 'do': 'make'}
    " Plug 'shawncplus/phpcomplete.vim'                                   " autocomplete php
    Plug 'Shougo/neopairs.vim'

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end()

" -----------------------------------------------------------------------------------------------------------------------------
" KEY BINDS / MAPPINGS
" -----------------------------------------------------------------------------------------------------------------------------

map <esc> :noh<cr>

vmap < <gv
vmap > >gv

nnoremap K 5k
nnoremap J 5j
nnoremap L 5l
nnoremap H 5h
nnoremap W w
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <s-f> : bp<CR>
nnoremap <s-m> : bn<CR>
nnoremap <s-t> : BD<CR>
nnoremap <c-f> :Tags<cr>
nnoremap <c-s> :so %<cr>

tnoremap <Esc> <C-\><C-n>

vnoremap K 5k
vnoremap J 5j
vnoremap H 5h
vnoremap L 5l
vnoremap A : <esc>ggVG<CR>
vnoremap y "+y
vnoremap p "+p
vnoremap A : <esc>ggVG<CR>
vnoremap <c-/> :Tcomment<cr>

" leader key binds
let mapleader = " "

nnoremap <leader>f : NERDTreeToggle<CR>
nnoremap <leader>t : Tagbar<CR>
nnoremap <leader>t :exec 'tag' expand('<cword>')<cr>
nnoremap <leader>T :Tags<cr>
nnoremap <leader>c <c-w>c
nnoremap <leader>s :split <cr>
nnoremap <leader>S :vsplit <cr>
nnoremap <leader>v :e ~/.config/nvim/init.vim <cr>
nnoremap <leader>g : FZF<CR>
nnoremap <leader>G : FZF<CR>
nnoremap <leader>r : so ~/.config/nvim/init.vim<CR>
:noremap <leader>u :w<Home>silent <End> !urlview<CR>

:command! WQ wq
:command! Wq wq
:command! Wa wa
:command! WA wa
:command! W w
:command! Q q

" -----------------------------------------------------------------------------------------------------------------------------
" VIM SETTINGS
" -----------------------------------------------------------------------------------------------------------------------------

syntax on
filetype plugin on

set showtabline=2
set number
set clipboard+=unnamedplus
set noswapfile
set nobackup 

set laststatus=2                                " always show the statusline

set foldmethod=marker
set rtp^=~/.config/nvim
set mouse-=a                                    " disable mouse
set path+=**                                    " able to search subdirs recursive
set nocompatible                                " no compatibility with old-skool vi
set wildmenu                                    " show command line completions
set wildmode=longest:full                       " complete mode for wildmenu
set wildmode+=full

set background=light                          

set linebreak                                   " only wrap after words, not inside words
set ignorecase                                  " ignore case in (search) patterns
set smartcase                                   " when the (search) pattern contains uppercase chars, don't ignore case
set hlsearch                                    " highlight all the matches for the search
set t_Co=256
set showcmd

set title
set ruler
set cursorline

set autoread                                    " automatically reload the file when modified outside and not modified inside
set autowrite                                   " write the modified file when switching to another file
set hidden                                      " allow Vim to switch to another buffer while the current is not saved

set expandtab                                   " expand tabs to spaces
set formatoptions+=r                            " automatic formatting: auto insert current comment leader after enter
set shiftwidth=4                                " number of spaces to use for each step of indent
set softtabstop=4                               " number of spaces that a tab counts for while editing
set tabstop=4                                   " number of spaces that a tab counts for
set smarttab                                    " Handle tabs more intelligently"
set autoindent                                  " automatically indent a new line

set shiftround                                  " rounds indent to a multiple of shiftwidth"
set tags=./tags;
set splitright
set splitbelow

" -----------------------------------------------------------------------------------------------------------------------------
" COLORS
" -----------------------------------------------------------------------------------------------------------------------------

colorscheme minimalist

hi SpellBad ctermfg=1 ctermbg=234
hi SpellCap ctermfg=1 ctermbg=234
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4
hi CursorLineNr guifg=yellow ctermfg=11
hi Visual gui=NONE guibg=White guifg=Black ctermfg=7 ctermbg=12

" -----------------------------------------------------------------------------------------------------------------------------
" PLUGIN SETTINGS
" -----------------------------------------------------------------------------------------------------------------------------

" INDENTLINE
let g:indentLine_color_tty_light = 200  " (default: 4)
let g:indentLine_color_dark = 210       " (default: 2)

" ALE
let g:ale_sign_column_always = 1
let g:ale_sign_error = '!'
let g:ale_sign_warning = '*'

" NERDTREE
let NERDTreeShowHidden=1
let NERDTreeHijackNetrw=0
let g:NERDTreeWinSize=30
let g:NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeCascadeSingleChildDir=0
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "$",
    \ "Untracked" : "?",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "x",
    \ "Dirty"     : "d",
    \ "Clean"     : "c",
    \ 'Ignored'   : 'i',
    \ "Unknown"   : "?"
    \ }

" AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'

" CLOSETAG
let g:closetag_filenames = '*.html,*.php,*.phtml,*.jinja,*.php'

" DEOPLETE 
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header = "/lib/clang"

let g:deoplete#sources#go#gocode_binary = '/home/sevaho/.go/bin/gocode'

let g:deoplete#sources#ternjs#tern_bin = '/usr/bin/tern'
let g:deoplete#sources#ternjs#timeout = 1

call deoplete#custom#source('neosnippet', 'rank', 1000)
call deoplete#custom#source('clang', 'rank', 900)
call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])

" NEOSNIPPET
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#disable_runtime_snippets = {'_' : 1,}

inoremap <c-space> pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr><CR> neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : pumvisible() ?
\ "\<C-y>" : "\<CR>"
inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ deoplete#mappings#manual_complete()
                function! s:check_back_space() abort
                let col = col('.') - 1
                return !col || getline('.')[col - 1]  =~ '\s'
                endfunction

imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" NEOPAIRS
let g:neopairs#enable = 1

" -----------------------------------------------------------------------------------------------------------------------------
" FUNCTIONS
" -----------------------------------------------------------------------------------------------------------------------------

" pressing F9 compiles python in vim and outputs to buffer
autocmd FileType python call AutoCmd_python()
fun! AutoCmd_python()
    nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
endf

" remember cursor position between vim sessions
autocmd BufReadPost *
            \ if line("'\'") > 0 && line ("'\"") <= line("$") |
            \		exe "normal! g'\"" |
            \ endif
autocmd BufRead * normal zz

" shift e will tell you some information about the code
nnoremap <s-e> :call <SID>SynStack()<CR>
function! <SID>SynStack()
if !exists("*synstack")
    return
endif
echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" auto close buffer
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" buffers the file
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 

autocmd BufWritePost .config/nvim/init.vim source %

autocmd FileType tex let g:neotex_enabled = 3

autocmd BufRead,BufNewFile *.conf setf cfg 
autocmd BufRead,BufNewFile config setf cfg 
