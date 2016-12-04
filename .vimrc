map <F3> : NERDTreeToggle<CR>
syntax on
let NERDTreeShowHidden=1

set t_Co=256
colorscheme minimalist

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

set tabstop=3
execute pathogen#infect()
call pathogen#helptags()

