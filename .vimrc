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

vnoremap K 5k
vnoremap J 5j
vnoremap H 5h
vnoremap L 5l
vnoremap A : <esc>ggVG<CR>
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
set paste

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
