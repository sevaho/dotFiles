map <F3> : NERDTreeToggle<CR>

syntax on
let NERDTreeShowHidden=1

set t_Co=256
colorscheme minimalist
set showcmd
set title
set ruler
 set cursorline
" set cursorcolumn

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=3
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_invoke_completion = '<S-Enter>'

set number
set autoread

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

