
" ----------------------------------------------------------------------------------------------------------------------------- SEVAHO DOTFILES
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
    Plug 'jamessan/vim-gnupg'                                           " GPG viewer

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " COMPLETIONS
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-markdown-subscope'
    Plug 'ncm2/ncm2-ultisnips'
    Plug 'ncm2/ncm2-jedi'
    Plug 'ncm2/ncm2-go'

    " Plug 'deoplete-plugins/deoplete-jedi'
    " Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
    " Plug 'Shougo/neopairs.vim'

    Plug 'autozimu/LanguageClient-neovim', {
       \ 'branch': 'next',
       \ 'do': 'bash install.sh',
       \ }
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " SNIPPETS
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " Plug 'Shougo/echodoc.vim'
    Plug 'jremmen/vim-ripgrep'


    " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " Plug 'ColinKennedy/vim-python-function-expander'

    " language pack
    Plug 'sheerun/vim-polyglot'

    Plug 'mzlogin/vim-markdown-toc'
    Plug 'itchyny/calendar.vim'

    Plug 'dhruvasagar/vim-table-mode'
    Plug 'vim-airline/vim-airline'                                      " airline
    Plug 'vim-airline/vim-airline-themes'                               " airline themes

    Plug 'scrooloose/nerdtree'                                          " nerdtree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                      " nerdtree colors
    Plug 'Xuyuanp/nerdtree-git-plugin'                                  " nerdtree git
    Plug 'majutsushi/tagbar'                                            " ctags on the right :TagbarToggle

    Plug 'qpkorr/vim-bufkill'

    Plug 'tomtom/tcomment_vim'                                          " commenting with g <

    Plug 'alvan/vim-closetag'                                           " autoclose html tags



    Plug 'dikiaap/minimalist'                                           " theme
    Plug 'NLKNguyen/papercolor-theme'

    " Plug 'w0rp/ale'                                                     " linting flake8 for python
    Plug 'MoerkerkeLander/ale'
    Plug 'mhinz/vim-signify'                                            " vcs tracker for Fossil fe.
    Plug 'mhinz/vim-startify'                                           " nice start page

    Plug 'Yggdroot/indentLine'                                          " indent
    Plug 'airblade/vim-gitgutter'                                       " gitgutter
    Plug 'tpope/vim-fugitive'

    " Plug 'iberianpig/tig-explorer.vim'
    " Plug 'rbgrouleff/bclose.vim'
    Plug 'codeindulgence/vim-tig'


    Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }                     " smart way to handle buffers and windows on deletion
    Plug 'donRaphaco/neotex', { 'for': 'tex' }                          " live edit tex files
    

call plug#end()


" -----------------------------------------------------------------------------------------------------------------------------
" KEY BINDS / MAPPINGS
" -----------------------------------------------------------------------------------------------------------------------------

" let g:calendar_google_calendar = 1
" let g:calendar_google_task = 1

map <esc> :noh<cr>

vmap < <gv
vmap > >gv

nmap K 5k
nnoremap K 5k
vm K 5k
nnoremap J 5j
nnoremap L 5l
nnoremap H 5h
nnoremap W w

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <s-f> : bp<CR>
nnoremap <s-m> : bn<CR>
nnoremap <s-t> : BD<CR>
nnoremap <c-f> :Tags<cr>
nnoremap <c-s> :so %<cr>

tnoremap <Esc> <C-\><C-n>

vnoremap ff za

vnoremap J 5j
vnoremap H 5h
vnoremap L 5l
vnoremap A : <esc>ggVG<CR>
vnoremap y "+y
vnoremap p "+p
vnoremap A : <esc>ggVG<CR>
vnoremap <c-/> :Tcomment<cr>
vnoremap <leader>p "_dP
nnoremap <leader>l :lopen<CR>
" leader key binds
let mapleader = " "

nnoremap Y y$
nnoremap <leader>f : NERDTreeToggle<CR>
nnoremap <leader>t : Tagbar<CR>
nnoremap <leader>T :belowright split <CR> :resize 6<CR> :set winfixheight <CR> :terminal <CR>
" nnoremap <leader>T :Tags<cr>
nnoremap <leader>c <c-w>c
nnoremap <leader>s :split <cr>
nnoremap <leader>S :vsplit <cr>
nnoremap <leader>v :e ~/.config/nvim/init.vim <cr>
nnoremap <leader>g : FZF<CR>
nnoremap <leader>G : FZF<CR>
nnoremap <leader>r : so ~/.config/nvim/init.vim<cr>:call UltiSnips#RefreshSnippets()<cr>
noremap <leader>u :w<Home>silent <End> !urlview<CR>

noremap <F4> :TagbarToggle<CR>
" noremap <F3> :ALEFix<CR>

nnoremap <F2> :exec '!python' shellescape(@%, 1)<cr>
"          noremap <F3> :ALEFix black<CR>

command! WQ wq
command! Wq wq
command! Wa wa
command! WA wa
command! W w
command! Q q

" -----------------------------------------------------------------------------------------------------------------------------
" VIM SETTINGS
" -----------------------------------------------------------------------------------------------------------------------------

"" Live substitute (neovim)
set inccommand=split
syntax on
filetype plugin on

set encoding=utf-8
set showtabline=2
set number
set clipboard+=unnamedplus
set noswapfile
set nobackup 

set laststatus=2                                " always show the statusline

set conceallevel=2
set foldmethod=marker
set rtp^=~/.config/nvim
set mouse-=a                                    " disable mouse
set path+=**                                    " able to search subdirs recursive
set nocompatible                                " no compatibility with old-skool vi
" set wildmenu                                    " show command line completions
" set wildmode=longest:full                       " complete mode for wildmenu
" set wildmode+=full


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
set fileformat=unix

set shiftround                                  " rounds indent to a multiple of shiftwidth"
set tags=./tags;
" set splitright
" set splitbelow
" set shortmess+=c
" set noshowmode
" set cmdheight=2
" set completeopt-=preview


" -----------------------------------------------------------------------------------------------------------------------------
" COLORS
" -----------------------------------------------------------------------------------------------------------------------------

colorscheme minimalist
" colorscheme PaperColor
" set background=light                          

hi SpellBad ctermfg=1 ctermbg=234
hi SpellCap ctermfg=1 ctermbg=234
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4
hi CursorLineNr guifg=yellow ctermfg=11
hi Visual gui=NONE guibg=White guifg=Black ctermfg=7 ctermbg=12

" -----------------------------------------------------------------------------------------------------------------------------
" PLUGIN SETTINGS
" -----------------------------------------------------------------------------------------------------------------------------

" ------
" Rg
" ------
let g:rg_highlight = 1
let g:rg_derive_root = 1

" ------
" UltiSnips
" ------
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "~/.config/nvim/snippets/"]
let g:UltiSnipsExpandTrigger = '<c-l>'   


let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsUsePythonVersion = 3

let g:snips_author = "Sebastiaan Van Hoecke"
let g:snips_email = "sebastiaan@sevaho.io"
let g:snips_github = "https://github.com/sevaho"

" ------
" Polyglot
" ------
let g:polyglot_disabled = ['markdown']

" ------
" Language client
" ------
let g:LanguageClient_settingsPath = "~/.config/nvim/settings.json"
let g:LanguageClient_hasSnippetSupport = 1
let g:LanguageClient_serverCommands = {
   \ 'python': ['pyls', '-vv', '--log-file', '/tmp/pyls.log'],
   \ 'c': ['clangd'],
   \ 'cpp': ['clangd'],
   \ 'json': ['json-languageserver', '--stdio'],
   \ 'html': ['html-languageserver', '--stdio'],
   \ 'cs': ['css-languageserver', '--stdio'],
   \ }


" \ 'go': ['gopls'],
" let g:LanguageClient_loggingFile = '/tmp/lc.log'
" let g:LanguageClient_loggingLevel = 'DEBUG'

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gk :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> grn :call LanguageClient#textDocument_rename()<CR>

let g:LanguageClient_diagnosticsList = "Location"

" ------
" Deoplete
" ------
" let g:deoplete#sources#go#gocode_binary = '/home/sevaho/.go/bin/gocode'
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#max_list = 25
" let g:deoplete#async_timeout = 311
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ deoplete#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <silent><expr> <c-space> deoplete#manual_complete()
" let g:jedi#show_call_signatures = 1

" ------
" ncm2
" ------
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
set shortmess+=c

let g:ncm2#popup_delay = 211
let g:ncm2#complete_delay = 61
let g:ncm2#popup_limit = 21
let g:ncm2#total_popup_limit = 41

let g:UltiSnipsRemoveSelectModeMappings = 1
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <C-Tab> ncm2#complete()

" ------
" INDENTLINE
" ------
let g:indentLine_color_tty_light = 200  " (default: 4)
let g:indentLine_color_dark = 210       " (default: 2)
let g:indentLine_setConceal = 0

" ------
" Ale
" ------
" call ale#linter#Define('go', {
" \   'name': 'revive',
" \   'output_stream': 'both',
" \   'executable': 'revive',
" \   'read_buffer': 1,
" \   'command': 'revive %t',
" \   'callback': 'ale#handlers#unix#HandleAsWarning',
" \})

let g:ale_completion_enabled = 0 " this fucks everything
let g:ale_linters = {'*': ['remove_trailing_lines', 'trim_whitespace'],'python': ['flake8', 'pyflakes', 'pycodestyle', 'bandit', 'pyre', 'mypy', 'isort'], 'javascript': ['eslint'], 'yaml': ['yamllint'], 'go': ['golangci_lint', 'gofmt', 'govet', 'staticcheck']}
let g:ale_fixers = {'python': ['isort', 'black'], 'javascript': ['prettier', 'eslint'], 'go': ['gofmt', 'goimports'], 'markdown': ['remark']}
let g:ale_python_autoflake_options = '--expand-star-imports --remove-all-unused-imports --remove-unused-variables --remove-duplicate-keys -s'
let g:ale_go_gofmt_options = '-s'
let g:ale_python_black_options = '-S -l 120'
let g:ale_python_isort_options = '-w 120'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '!'
let g:ale_sign_warning = '*'
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[ALE %linter%] %s [%severity%]'

highlight ALEErrorSign ctermbg=red ctermfg=white
highlight ALEWarningSign ctermbg=blue ctermfg=white


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

" TAGBAR
let g:tagbar_width = 45


" AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'
let g:airline#extensions#ale#enabled = 1

let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#tagbar#enabled = 0

" CLOSETAG
let g:closetag_filenames = '*.html,*.php,*.phtml,*.jinja,*.php'

"
" -----------------------------------------------------------------------------------------------------------------------------
" AUTOCMDS
" -----------------------------------------------------------------------------------------------------------------------------

augroup autocmds
"
    " pressing F9 compiles python in vim and outputs to buffer
    autocmd FileType json call AutoCmd_json()
    fun! AutoCmd_json()
        nnoremap <buffer> <F3> :exec '%!python -m json.tool'<cr>
    endf

    " pressing F9 compiles python in vim and outputs to buffer
    autocmd FileType sh call AutoCmd_sh()
    fun! AutoCmd_sh()
        nnoremap <buffer> <F2> :exec '!bash' shellescape(@%, 1)<cr>
    endf

    " pressing F9 compiles python in vim and outputs to buffer
    autocmd FileType python call AutoCmd_python()
    fun! AutoCmd_python()

        noremap <F3> :ALEFix black<CR>
        nnoremap <buffer> <F2> :exec '!python' shellescape(@%, 1)<cr>
        nnoremap <buffer> <F6> :e ~/.config/nvim/snippets/python.snippets <cr>
    endf

    " pressing F9 compiles python in vim and outputs to buffer
    autocmd FileType go call AutoCmd_go()
    fun! AutoCmd_go()
        noremap <F3> :ALEFix gofmt<CR>
        nnoremap <buffer> <F2> :exec '!go run' shellescape(@%, 1)<cr>
    endf

    autocmd FileType scss call AutoCmd_scss()
    fun! AutoCmd_scss()
        nnoremap <buffer> <F2> :exec '!sassc app.scss > app.css'<cr>
    endf

    autocmd FileType javascript call AutoCmd_js()
    fun! AutoCmd_js()
        nnoremap <buffer> <F2> :exec '!node' shellescape(@%, 1)<cr>
        nnoremap <buffer> <F3> :exec '!eslint --fix' shellescape(@%, 1)<cr>
        set tabstop=2       " number of visual spaces per TAB
        set softtabstop=2   " number of spaces in tab when editing
        set shiftwidth=2    " number of spaces to use for autoindent
    endf

    autocmd FileType yaml call AutoCmd_yaml()
    fun! AutoCmd_yaml()
        nnoremap <buffer> <F3> :exec '!yamllint' shellescape(@%, 1)<cr>
        set tabstop=2       " number of visual spaces per TAB
        set softtabstop=2   " number of spaces in tab when editing
        set shiftwidth=2    " number of spaces to use for autoindent
    endf
    autocmd BufNewFile,BufRead yaml.snippets call AutoCmd_yaml()
"
    " remember cursor position between vim sessions
    autocmd BufReadPost *
                \ if line("'\'") > 0 && line ("'\"") <= line("$") |
                \		exe "normal! g'\"" |
                \ endif
    autocmd BufRead * normal zz


    " auto close buffer
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif

    autocmd BufWritePost .config/nvim/init.vim source %

    autocmd BufRead,BufNewFile *.conf setf cfg 
    autocmd BufRead,BufNewFile config setf cfg 

    autocmd BufNewFile,BufRead *.ejs set filetype=html
"
    " disables keybindings when focussing on nerdtree
    autocmd FileType nerdtree noremap <buffer> <s-f> <nop>
    autocmd FileType nerdtree noremap <buffer> <s-m> <nop>

    " autocmd VimResized * :wincmd =
"
augroup END

" merging stuff from landeuur
if &diff
   set cursorline
   map ] ]c
   map [ [c

   map <leader>l :diffget LO<cr>
   map <leader>r :diffget RE<cr>

   let g:LanguageClient_diagnosticsEnable = 0
endif

" Resize windows using arrow keys
noremap <up>    <C-W>+
noremap <down>  <C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>

