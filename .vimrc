" KEY BINDS
map <F3> : NERDTreeToggle<CR>
map <F4> : bp<CR>
map <F5> : bn<CR>

syntax on

set nocompatible                              " no compatibility with old-skool vi
set wildmenu                                  " show command line completions"
set wildmode=longest:full                     " complete mode for wildmenu"
set wildmode+=full
set background=light                          
set linebreak                                 " only wrap after words, not inside words"
set autoindent                                " automatically indent a new line"
set ignorecase                                " ignore case in (search) patterns"
set smartcase                                 " when the (search) pattern contains uppercase chars, don't ignore case"
set hlsearch                                  " highlight all the matches for the search "
set t_Co=256
set showcmd
set noswapfile
set nobackup 
set title
set ruler
set cursorline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set autoread                            " automatically reload the file when modified outside and not modified inside"
set autowrite                           " write the modified file when switching to another file"
set hidden                              " allow Vim to switch to another buffer while the current is not saved"
set expandtab                                 " expand tabs to spaces"
set formatoptions+=r                          " automatic formatting: auto insert current comment leader after enter"
set shiftwidth=2                              " number of spaces to use for each step of indent"
set softtabstop=2                             " number of spaces that a tab counts for while editing"
set tabstop=2                                 " number of spaces that a tab counts for"
set number
set laststatus=2                        " always show the statusline"

" Highlight trailing whitespace and TAB characters
" source: http://vim.wikia.com/wiki/Highlight_unwanted_spaces
"highlight ExtraWhitespace ctermbg=red guibg=red
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$\| \+\ze\t\|\t/"

" COLORSCHEME
colorscheme minimalist 

" PLUGINS
" SYNTASTIC
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" NERDTREE
let NERDTreeShowHidden=1

" AIRLINE
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" YOUCOMPLETEME
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_invoke_completion = '<S-Enter>'

" NO ARROW KEYS
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

execute pathogen#infect()
call pathogen#helptags()

" COLOR 
hi SpellBad ctermfg=196 ctermbg=231
hi SpellCap ctermfg=196 ctermbg=231


