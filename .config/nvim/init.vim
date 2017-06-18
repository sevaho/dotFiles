" SEE PLUGINS FOLDER
" -----------------------------------------------------------------------------------------------------------------------------
" -----------------------------------------------------------------------------------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')

" SYNTAX
Plug 'https://github.com/PProvost/vim-ps1'
Plug 'https://github.com/digitaltoad/vim-pug.git'
Plug 'https://github.com/lervag/vimtex'
Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'jwalton512/vim-blade'

" NERDTREE
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

" AIRLINE
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'

" indent
Plug 'https://github.com/Yggdroot/indentLine.git'

" git
Plug 'https://github.com/airblade/vim-gitgutter.git'

" commenting with g <
Plug 'tomtom/tcomment_vim'

" match html tags/xml
Plug 'Valloric/MatchTagAlways' " ADD PHP TO 

" linting
Plug 'https://github.com/w0rp/ale.git'

" snippets
Plug 'Shougo/neosnippet'

" AUTOCOMPLETES
" Plug 'https://github.com/ervandew/supertab'
Plug 'https://github.com/Shougo/deoplete.nvim'
Plug 'https://github.com/zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'padawan-php/deoplete-padawan' " composer global require mkusher/padawan
Plug 'https://github.com/shawncplus/phpcomplete.vim'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" THEMES
Plug 'https://github.com/dikiaap/minimalist'
			
" OTHER
" Plug 'wincent/terminus'
Plug 'terryma/vim-multiple-cursors'
Plug 'mhinz/vim-signify' " vcs tracker for Fossil fe.
Plug 'mhinz/vim-startify' " nice start page
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }

call plug#end()


" -----------------------------------------------------------------------------------------------------------------------------
" KEY BINDS / MAPPINGS
" -----------------------------------------------------------------------------------------------------------------------------

nnoremap <s-f> : bp<CR>
nnoremap <s-m> : bn<CR>
nnoremap <s-t> : bd<CR>
nnoremap K 5k
nnoremap J 5j
nnoremap L 5l
nnoremap H 5h
vnoremap K 5k
vnoremap J 5j
vnoremap H 5h
vnoremap L 5l
nnoremap ; :

" No need to ex mode and macros
nnoremap Q <nop>
map q <Nop>
vmap < <gv
vmap > >gv
vnoremap <c-/> :Tcomment<cr>
map <esc> :noh<cr>
" auto close
inoremap { {}<Left>
inoremap [ []<Left>


" -----------------------------------------------------------------------------------------------------------------------------
" VIM SETTINGS
" -----------------------------------------------------------------------------------------------------------------------------

syntax on
filetype plugin on
set rtp^=~/.config/nvim
set mouse-=a                                  " disable mouse
set path+=**                                  " able to search subdirs recursive
set nocompatible                              " no compatibility with old-skool vi
set wildmenu                                  " show command line completions
set wildmode=longest:full                     " complete mode for wildmenu
set wildmode+=full
set background=light                          
set linebreak                                 " only wrap after words, not inside words
set autoindent                                " automatically indent a new line
set ignorecase                                " ignore case in (search) patterns
set smartcase                                 " when the (search) pattern contains uppercase chars, don't ignore case
set hlsearch                                  " highlight all the matches for the search
set t_Co=256
set showcmd
set noswapfile
set nobackup 
set title
set ruler
set cursorline
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set autoread                            " automatically reload the file when modified outside and not modified inside
set autowrite                           " write the modified file when switching to another file
set hidden                              " allow Vim to switch to another buffer while the current is not saved
set expandtab                                 " expand tabs to spaces
set formatoptions+=r                          " automatic formatting: auto insert current comment leader after enter
set shiftwidth=4                              " number of spaces to use for each step of indent
set softtabstop=4                             " number of spaces that a tab counts for while editing
set tabstop=4                                 " number of spaces that a tab counts for
set number
set laststatus=2                        " always show the statusline
set smartindent " use smart indent if there is no indent file"
set smarttab " Handle tabs more intelligently"
set shiftround " rounds indent to a multiple of shiftwidth"
" set omnifunc=syntaxcomplete#Complete
let mapleader = " "

" -----------------------------------------------------------------------------------------------------------------------------
" OLORSCHEME
" -----------------------------------------------------------------------------------------------------------------------------

nnoremap <leader>c : colorscheme mayansmoke <cr>
nnoremap <leader>C : colorscheme minimalist <cr>

colorscheme mayansmoke

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

" INDENTLINE
let g:indentLine_color_tty_light = 200 " (default: 4)
let g:indentLine_color_dark = 210 " (default: 2)

" DEOPLETE & NEOSNIPPET
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

" FZF
nnoremap <leader>j : FZF<CR>

" -----------------------------------------------------------------------------------------------------------------------------
" COLORS
" -----------------------------------------------------------------------------------------------------------------------------

hi SpellBad ctermfg=1 ctermbg=234
hi SpellCap ctermfg=1 ctermbg=234
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4
hi  CursorLineNr guifg=yellow ctermfg=3

" -----------------------------------------------------------------------------------------------------------------------------
" FUNCTIONS
" -----------------------------------------------------------------------------------------------------------------------------

" pressing F9 compiles python in vim and outputs to buffer
autocmd FileType python call AutoCmd_python()
fun! AutoCmd_python()
        "setlocal other options for python, then:
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
