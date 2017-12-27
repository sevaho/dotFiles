" -----------------------------------------------------------------------------------------------------------------------------
" PLUGINS
" -----------------------------------------------------------------------------------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')

" Plug 'itchyny/lightline.vim'		" a really cool status bar
" Plug 'mgee/lightline-bufferline'	" Show buffers in tabline

Plug 'junegunn/goyo.vim'		                                " distraction free writing
Plug 'junegunn/limelight.vim'		                            " hyperfocused writing
Plug 'reedes/vim-pencil'		                                " improved writing experience
Plug 'majutsushi/tagbar'
Plug 'hashivim/vim-vagrant'
Plug 'qpkorr/vim-bufkill'
Plug 'PProvost/vim-ps1'                                         " syntax colors
Plug 'digitaltoad/vim-pug'                                      " syntax colors
Plug 'lervag/vimtex'                                            " syntax colors
Plug 'pangloss/vim-javascript'                                  " syntax colors
Plug 'jwalton512/vim-blade'                                     " syntax colors
Plug 'scrooloose/nerdtree'                                      " nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                  " nerdtree colors
Plug 'Xuyuanp/nerdtree-git-plugin'                              " nerdtree git
Plug 'vim-airline/vim-airline'                                  " airline
Plug 'vim-airline/vim-airline-themes'                           " airline themes
Plug 'Yggdroot/indentLine'                                      " indent
Plug 'airblade/vim-gitgutter'                                   " gitgutter
Plug 'tomtom/tcomment_vim'                                      " commenting with g <
Plug 'Valloric/MatchTagAlways'                                  " match tags, add this also to php
Plug 'w0rp/ale'                                                 " linting flake8 for python
Plug 'Shougo/neosnippet'                                        " snippets
Plug 'Shougo/deoplete.nvim'                                     " autocomplete
Plug 'zchee/deoplete-jedi'                                      " autocomplete python
Plug 'zchee/deoplete-clang'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install' }
Plug 'shawncplus/phpcomplete.vim'                               " autocomplete php
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'junegunn/fzf.vim'
Plug 'dikiaap/minimalist'                                       " theme
Plug 'mhinz/vim-signify'                                        " vcs tracker for Fossil fe.
Plug 'mhinz/vim-startify'                                       " nice start page
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'donRaphaco/neotex', { 'for': 'tex' }

call plug#end()

" -----------------------------------------------------------------------------------------------------------------------------
" KEY BINDS / MAPPINGS
" -----------------------------------------------------------------------------------------------------------------------------

map q <Nop>
map <esc> :noh<cr>

vmap < <gv
vmap > >gv

nnoremap <s-f> : bp<CR>
nnoremap <s-m> : bn<CR>
nnoremap <s-t> : BD<CR>
nnoremap qq : <esc>:x<CR>
nnoremap K 5k
nnoremap J 5j
nnoremap L 5l
nnoremap H 5h
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap p "+p
nnoremap ; :
nnoremap W w
nnoremap Q <nop>
nnoremap yy "+yy
nnoremap <c-f> :Tags<cr>
nnoremap <c-s> :so %<cr>

vnoremap K 5k
vnoremap J 5j
vnoremap H 5h
vnoremap L 5l
vnoremap A : <esc>ggVG<CR>
vnoremap <c-/> :Tcomment<cr>
vnoremap y "+y
vnoremap p "+p

inoremap { {}<Left>
inoremap [ []<Left>

tnoremap <Esc> <C-\><C-n>

:command! WQ wq
:command! Wq wq
:command! Wa wa
:command! WA wa
:command! W w
:command! Q q

" -----------------------------------------------------------------------------------------------------------------------------
" VIM SETTINGS
" -----------------------------------------------------------------------------------------------------------------------------

set foldmethod=marker
set clipboard+=unnamedplus
set rtp^=~/.config/nvim
set mouse-=a                                    " disable mouse
set path+=**                                    " able to search subdirs recursive
set nocompatible                                " no compatibility with old-skool vi
set wildmenu                                    " show command line completions
set wildmode=longest:full                       " complete mode for wildmenu
set wildmode+=full
set background=light                          
set linebreak                                   " only wrap after words, not inside words
set autoindent                                  " automatically indent a new line
set ignorecase                                  " ignore case in (search) patterns
set smartcase                                   " when the (search) pattern contains uppercase chars, don't ignore case
set hlsearch                                    " highlight all the matches for the search
set t_Co=256
set showcmd
set noswapfile
set nobackup 
set title
set ruler
set cursorline
set statusline+=%#warningmsg#
set statusline+=%*
set autoread                                    " automatically reload the file when modified outside and not modified inside
set autowrite                                   " write the modified file when switching to another file
set hidden                                      " allow Vim to switch to another buffer while the current is not saved
set expandtab                                   " expand tabs to spaces
set formatoptions+=r                            " automatic formatting: auto insert current comment leader after enter
set shiftwidth=4                                " number of spaces to use for each step of indent
set softtabstop=4                               " number of spaces that a tab counts for while editing
set tabstop=4                                   " number of spaces that a tab counts for
set number relativenumber
set laststatus=2                                " always show the statusline
set smartindent                                 " use smart indent if there is no indent file"
set smarttab                                    " Handle tabs more intelligently"
set shiftround                                  " rounds indent to a multiple of shiftwidth"
set tags=./tags;
set splitright
set splitbelow
set expandtab                                   " expand tabs to spaces
let g:netrw_liststyle = 3		                " Use tree view in file explorer

syntax on
filetype plugin on
let mapleader = " "

nnoremap <leader>t :exec 'tag' expand('<cword>')<cr>
nnoremap <leader>T :Tags<cr>
nnoremap <leader>c <c-w>c
nnoremap <leader>s :split <cr>
nnoremap <leader>S :vsplit <cr>
nnoremap <leader>v :e ~/.config/nvim/init.vim <cr>
nnoremap <leader>g : FZF<CR>

" -----------------------------------------------------------------------------------------------------------------------------
" COLORSCHEME
" -----------------------------------------------------------------------------------------------------------------------------

" nnoremap <leader>c : colorscheme mayansmoke <cr>
" nnoremap <leader>C : colorscheme minimalist <cr>

colorscheme minimalist

" -----------------------------------------------------------------------------------------------------------------------------
" PLUGIN SETTINGS
" -----------------------------------------------------------------------------------------------------------------------------

" PENCIL
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

" LATEX


" PYTHON


" GO
let g:deoplete#sources#go#gocode_binary = '/home/sevaho/.go/bin/gocode'

" ALE
let g:ale_sign_column_always = 1
let g:ale_sign_error = '!'
let g:ale_sign_warning = '*'
let g:tern_request_timeout = 1

" AIRLINE
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='minimalist'

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
nnoremap <leader>f : NERDTreeToggle<CR>

" indentLine
let g:indentLine_color_tty_light = 200  " (default: 4)
let g:indentLine_color_dark = 210       " (default: 2)

" clang
let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header = "/lib/clang"

" deoplete and neosnippet
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#disable_runtime_snippets = {
        \   '_' : 1,
        \ }

let g:deoplete#enable_at_startup = 1

inoremap <c-space> pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr><CR> neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : pumvisible() ?
\ "\<C-y>" : "\<CR>"
inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ deoplete#mappings#manual_complete()
                function! s:check_back_space() abort "{{{
                let col = col('.') - 1
                return !col || getline('.')[col - 1]  =~ '\s'
                endfunction"}}}
    imap <expr><TAB>
    \ pumvisible() ? "\<C-n>" :
    \ neosnippet#expandable_or_jumpable() ?
    \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


" -----------------------------------------------------------------------------------------------------------------------------
" COLORS
" -----------------------------------------------------------------------------------------------------------------------------

hi SpellBad ctermfg=1 ctermbg=234
hi SpellCap ctermfg=1 ctermbg=234
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4
hi CursorLineNr guifg=yellow ctermfg=11
hi Visual gui=NONE guibg=White guifg=Black ctermfg=7 ctermbg=12

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

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,vimwiki call pencil#init()
 autocmd FileType text         call pencil#init({'wrap': 'hard'})
augroup END

autocmd BufRead,BufNewFile *.conf setf cfg 
autocmd BufRead,BufNewFile config setf cfg 
