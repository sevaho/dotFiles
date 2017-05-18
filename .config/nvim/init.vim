
call plug#begin('~/.local/share/nvim/plugged')

Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/jiangmiao/auto-pairs.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'https://github.com/digitaltoad/vim-pug.git'
Plug 'https://github.com/nathanaelkane/vim-indent-guides.git'
Plug 'https://github.com/Yggdroot/indentLine.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/shawncplus/phpcomplete.vim'
Plug 'https://github.com/lervag/vimtex'
Plug 'https://github.com/PProvost/vim-ps1'
Plug 'jwalton512/vim-blade'
Plug 'tomtom/tcomment_vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'gko/vim-coloresque'
Plug 'Valloric/MatchTagAlways' " ADD PHP TO 
Plug 'https://github.com/w0rp/ale.git'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'


" AUTOCOMPLETES
Plug 'https://github.com/Shougo/deoplete.nvim'
Plug 'https://github.com/davidhalter/jedi-vim'
Plug 'https://github.com/zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'https://github.com/ervandew/supertab'
Plug 'padawan-php/deoplete-padawan'

" THEMES
Plug 'mhartington/oceanic-next'
Plug 'https://github.com/dikiaap/minimalist'

call plug#end()

let g:tern_request_timeout = 1

set rtp^=~/.config/nvim
let g:UltiSnipsExpandTrigger="<c-w>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories='~/.config/nvim/UltiSnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:livepreview_previewer = 'mupdf'

" KEY BINDS
nnoremap <Space> : NERDTreeToggle<CR>
nnoremap <s-f> : bp<CR>
"nnoremap <s-d> : bn<CR>
nnoremap <s-t> : bd<CR>

syntax on

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
set shiftwidth=2                              " number of spaces to use for each step of indent
set softtabstop=2                             " number of spaces that a tab counts for while editing
set tabstop=2                                 " number of spaces that a tab counts for
set number
set laststatus=2                        " always show the statusline
set autoindent " always set autoindenting on"
set smartindent " use smart indent if there is no indent file"
set tabstop=2 " <tab> inserts 4 spaces"
set softtabstop=2 " <BS> over an autoindent deletes 4 spaces."
set smarttab " Handle tabs more intelligently"
set expandtab " Use spaces, not tabs, for autoindent/tab key."
set shiftwidth=2 " an indent level is 4 spaces wide."
set shiftround " rounds indent to a multiple of shiftwidth"
set omnifunc=syntaxcomplete#Complete
filetype plugin on


" Highlight trailing whitespace and TAB characters
" source: http://vim.wikia.com/wiki/Highlight_unwanted_spaces
"highlight ExtraWhitespace ctermbg=red guibg=red
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$\| \+\ze\t\|\t/

" COLORSCHEME
colorscheme minimalist 
"colorscheme OceanicNext

" PLUGINS

" ALE
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'

" AIRLINE
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='minimalist'

" NERDTREE
let NERDTreeShowHidden=1
let NERDTreeHijackNetrw=0
let g:NERDTreeWinSize=45
let g:NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeCascadeSingleChildDir=0
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" INDENTLINE
let g:indentLine_color_tty_light = 200 " (default: 4)
let g:indentLine_color_dark = 210 " (default: 2)

" NEOSNIPPET
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
" let g:neosnippet#disable_runtime_snippets

" imap <expr><CR> neosnippet#expandable_or_jumpable() ?
"       \ "\<Plug> (neosnippet_expand_target)" : "\<CR>"
" imap <expr><CR> neosnippet#expandable() ? "\<Plug> (neosnippet_expand)" : "\<CR>"
imap <expr><CR> neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : "\<CR>"



" COLORS
hi SpellBad ctermfg=196 ctermbg=231
hi SpellCap ctermfg=196 ctermbg=231
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4

" FUNCTIONS
autocmd FileType python call AutoCmd_python()
  fun! AutoCmd_python()
        "setlocal other options for python, then:
  nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
endf
