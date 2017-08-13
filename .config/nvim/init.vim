" -----------------------------------------------------------------------------------------------------------------------------
" PLUGINS
" -----------------------------------------------------------------------------------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')

Plug 'https://github.com/PProvost/vim-ps1'                      " syntax colors
Plug 'https://github.com/digitaltoad/vim-pug.git'               " syntax colors
Plug 'https://github.com/lervag/vimtex'                         " syntax colors
Plug 'https://github.com/pangloss/vim-javascript.git'           " syntax colors
Plug 'jwalton512/vim-blade'                                     " syntax colors
Plug 'https://github.com/scrooloose/nerdtree.git'               " nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                  " nerdtree colors
Plug 'Xuyuanp/nerdtree-git-plugin'                              " nerdtree git
Plug 'https://github.com/vim-airline/vim-airline.git'           " airline
Plug 'https://github.com/vim-airline/vim-airline-themes.git'    " airline themes
Plug 'https://github.com/Yggdroot/indentLine.git'               " indent
Plug 'https://github.com/airblade/vim-gitgutter.git'            " gitgutter
Plug 'tomtom/tcomment_vim'                                      " commenting with g <
Plug 'Valloric/MatchTagAlways'                                  " match tags, add this also to php
Plug 'https://github.com/w0rp/ale.git'                          " linting
Plug 'Shougo/neosnippet'                                        " snippets
Plug 'https://github.com/Shougo/deoplete.nvim'                  " autocomplete
Plug 'https://github.com/zchee/deoplete-jedi'                   " autocomplete python
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'padawan-php/deoplete-padawan'                             " autocomplete php, composer global require mkusher/padawan
Plug 'https://github.com/shawncplus/phpcomplete.vim'            " autocomplete php
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/dikiaap/minimalist'                    " theme
Plug 'mhinz/vim-signify'                                        " vcs tracker for Fossil fe.
Plug 'mhinz/vim-startify'                                       " nice start page
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }

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
nnoremap <s-t> : bd<CR>
nnoremap qq : <esc>:x<CR>
nnoremap K 5k
nnoremap J 5j
nnoremap L 5l
nnoremap H 5h
nnoremap p "+p
nnoremap ; :
nnoremap Q <nop>
nnoremap yy "+yy

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
set number
set laststatus=2                                " always show the statusline
set smartindent                                 " use smart indent if there is no indent file"
set smarttab                                    " Handle tabs more intelligently"
set shiftround                                  " rounds indent to a multiple of shiftwidth"

syntax on
filetype plugin on
let mapleader = " "

" -----------------------------------------------------------------------------------------------------------------------------
" COLORSCHEME
" -----------------------------------------------------------------------------------------------------------------------------

nnoremap <leader>c : colorscheme mayansmoke <cr>
nnoremap <leader>C : colorscheme minimalist <cr>

colorscheme minimalist

" -----------------------------------------------------------------------------------------------------------------------------
" PLUGIN SETTINGS
" -----------------------------------------------------------------------------------------------------------------------------

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

" deoplete and neosnippet
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#disable_runtime_snippets = {
        \   '_' : 1,
        \ }

let g:deoplete#enable_at_startup = 1

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

" fzf
nnoremap <leader>j : FZF<CR>

" -----------------------------------------------------------------------------------------------------------------------------
" COLORS
" -----------------------------------------------------------------------------------------------------------------------------

hi SpellBad ctermfg=1 ctermbg=234
hi SpellCap ctermfg=1 ctermbg=234
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4
hi CursorLineNr guifg=yellow ctermfg=3
hi Visual gui=NONE guibg=White guifg=Black ctermfg=7 ctermbg=11

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
