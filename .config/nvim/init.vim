
" ----------------------------------------------------------------------------------------------------------------------------- SEVAHO DOTFILES
" -----------------------------------------------------------------------------------------------------------------------------
"
" author: Sebastiaan Van Hoecke
" mail: sebastiaan@sevaho.io
"
" -----------------------------------------------------------------------------------------------------------------------------
"  MIGRAITON GUIDES:
" https://github.com/nanotee/nvim-lua-guide/
" https://teukka.tech/luanvim.html
" https://alpha2phi.medium.com/neovim-lsp-enhanced-a3d313abee65

" -----------------------------------------------------------------------------------------------------------------------------
" KEY BINDS / MAPPINGS
" -----------------------------------------------------------------------------------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')
    Plug 'mechatroner/rainbow_csv'

    Plug 'joerdav/templ.vim'

    " Plug 'Exafunction/codeium.vim'
    Plug 'hashivim/vim-terraform'

    Plug 'kdheepak/lazygit.nvim'

    " Plug 'steelsojka/completion-buffers'

    Plug 'digitaltoad/vim-pug'
    Plug 'tpope/vim-fugitive'

    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'neovim/nvim-lspconfig'

    Plug 'ray-x/lsp_signature.nvim'
    " Plug 'nvim-lua/diagnostic-nvim'

    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    " "Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-calc'
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'


    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    "
    "" Autocompletion framework for built-in LSP
    " Plug 'nvim-lua/completion-nvim'



    " Plug 'ncm2/ncm2'
    " Plug 'ncm2/ncm2-path'
    " Plug 'ncm2/ncm2-bufword'
    " Plug 'ncm2/ncm2-ultisnips'
    " Plug 'ncm2/ncm2-vim-lsp'
    "
    " Plug 'roxma/nvim-yarp'
    " Plug 'jamessan/vim-gnupg'                                           " GPG viewer
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " COMPLETIONS
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    "
    " Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
    " Plug 'autozimu/LanguageClient-neovim', {
    "    \ 'branch': 'next',
    "    \ 'do': 'bash install.sh',
    "    \ }
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " SNIPPETS
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    Plug 'Shougo/echodoc.vim'
    Plug 'jremmen/vim-ripgrep'

    Plug 'mzlogin/vim-markdown-toc'

    Plug 'dhruvasagar/vim-table-mode'
    Plug 'vim-airline/vim-airline'                                      " airline
    Plug 'vim-airline/vim-airline-themes'                               " airline themes

    Plug 'scrooloose/nerdtree'                                          " nerdtree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                      " nerdtree colors
    " Plug 'Xuyuanp/nerdtree-git-plugin'                                  " nerdtree git
    " Plug 'majutsushi/tagbar'                                            " ctags on the right :TagbarToggle

    Plug 'qpkorr/vim-bufkill'

    Plug 'tomtom/tcomment_vim'                                          " commenting with g <

" "    Plug 'alvan/vim-closetag'                                           " autoclose html tags

    " Plug 'm4xshen/autoclose.nvim'


    Plug 'evanleck/vim-svelte'                                          " svelte
    Plug 'leafgarland/typescript-vim'

    Plug 'dikiaap/minimalist'                                           " theme
    Plug 'NLKNguyen/papercolor-theme'

    Plug 'AlexvZyl/nordic.nvim'

    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

    Plug 'w0rp/ale'                                                     " linting flake8 for python
    Plug 'mhinz/vim-startify'                                           " nice start page
    "
    Plug 'junegunn/goyo.vim'


    Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }                     " smart way to handle buffers and windows on deletion

    " Plug 'lepture/vim-jinja'

    Plug 'nanotee/sqls.nvim'

call plug#end()

" -----------------------------------------------------------------------------------------------------------------------------
" COLORS
" -----------------------------------------------------------------------------------------------------------------------------


" colorscheme minimalist
" colorscheme kanagawa
" "colorscheme nordic

hi SpellBad ctermfg=1 ctermbg=234
hi SpellCap ctermfg=1 ctermbg=234
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4
hi CursorLineNr guifg=yellow ctermfg=11
hi Visual gui=NONE guibg=White guifg=Black ctermfg=7 ctermbg=12


autocmd Filetype  setlocal omnifunc=v:lua.vim.lsp.omnifunc

lua << EOF

    -- vim.lsp.set_log_level("debug")
    local nvim_lsp = require('lspconfig')

    nvim_lsp.htmx.setup{}

    -- Change preview window location
    vim.g.splitbelow = true

    -- Highlight on yank
    vim.api.nvim_exec([[
        augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
        augroup end
    ]], false)



    -- require("autoclose").setup()

    -- autoimport
    -- vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
    -- Y yank until the end of line
    -- vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true})



    local on_attach = function(_client, bufnr)
        local opts = { noremap=true, silent=true }
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gR', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gs', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

    end


    -- Enable the following language servers
    require'lspconfig'.pylsp.setup{
        settings = {
            pylsp = {
            plugins = {
                ruff = {
                    enabled = true
                },
                pycodestyle = {
                    enabled = false
                },
                pyflakes = {
                    enabled = false
                },
                mccabe = {
                    enabled = false
                }
            }
            }
        },
        on_attach = on_attach,
    }
    require'lspconfig'.tailwindcss.setup{
        on_attach = on_attach,
    }
    require'lspconfig'.html.setup{
        on_attach = on_attach,
    }
    require'lspconfig'.templ.setup{
        on_attach = on_attach,
    }
    require'lspconfig'.htmx.setup{
        on_attach = on_attach,
    }
    require'lspconfig'.nil_ls.setup{
        on_attach = on_attach,
    }
    require'lspconfig'.nixd.setup{
        on_attach = on_attach,
    }
    require'lspconfig'.gopls.setup{
        on_attach = on_attach,
        settings = {
            gopls = {
                gofumpt = true
            }
        }
    }
    require'lspconfig'.svelte.setup{
        on_attach = on_attach,
    }
    require('lspconfig').sqlls.setup{

        on_attach = function(client, bufnr)
            require('sqlls').on_attach(client, bufnr)
        end
    }


    -- Map :Format to vim.lsp.buf.formatting()
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])


    -- Compe setup (autocompletion plugin)
    -- require'compe'.setup {
    --     enabled = true;
    --     autocomplete = true;
    --     debug = true;
    --     min_length = 1;
    --     preselect = 'enable';
    --     throttle_time = 80;
    --     source_timeout = 200;
    --     resolve_timeout = 800;
    --     incomplete_delay = 400;
    --     max_abbr_width = 100;
    --     max_kind_width = 100;
    --
    --     max_menu_width = 100;
    --     documentation = true;
    --
    --     source = {
    --         path = true;
    --         buffer = true;
    --         calc = true;
    --         nvim_lsp = true;
    --         ultisnips = true;
    --     };
    -- }


    local cmp = require'cmp'
    cmp.setup({
        snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end,
        },
        window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

        -- ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ["<Tab>"] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                else
                    cmp.complete()
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                    vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
                else
                    fallback()
                end
            end,
            s = function(fallback)
                if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                    vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
                else
                    fallback()
                end
            end
        }),
        ["<S-Tab>"] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                else
                    cmp.complete()
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                    return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
                else
                    fallback()
                end
            end,
            s = function(fallback)
                if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                    return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
                else
                    fallback()
                end
            end
        }),
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'ultisnips' }, -- For ultisnips users.
            { name = 'path' },
            { name = 'calc' },
            { name = 'buffer' },
        }
        )
    })

    local t = function(str)

        return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    local check_back_space = function()
        local col = vim.fn.col('.') - 1
        if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            return true
        else
            return false
        end
    end

    -- Use (s-)tab to:
    --- move to prev/next item in completion menuone
    --- jump to prev/next snippet's placeholder
    -- _G.tab_complete = function()
    -- if vim.fn.pumvisible() == 1 then
    --     return t "<C-n>"
    -- elseif check_back_space() then
    --     return t "<Tab>"
    -- else
    --     return vim.fn['compe#complete']()
    -- end
    -- end
    -- _G.s_tab_complete = function()
    -- if vim.fn.pumvisible() == 1 then
    --     return t "<C-p>"
    -- else
    --     return t "<S-Tab>"
    -- end
    -- end

    -- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
    -- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
    -- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
    -- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
   -- require("catppuccin").setup({
   --     flavour = "auto", -- latte, frappe, macchiato, mocha
   --     background = { -- :h background
   --         light = "latte",
   --         dark = "frappe",
   --     },
   --     transparent_background = true, -- disables setting the background color.
   --     show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
   --     term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
   --     dim_inactive = {
   --         enabled = false, -- dims the background color of inactive window
   --         shade = "dark",
   --         percentage = 0.15, -- percentage of the shade to apply to the inactive window
   --     },
   --     no_italic = false, -- Force no italic
   --     no_bold = false, -- Force no bold
   --     no_underline = false, -- Force no underline
   --     styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
   --         comments = { "italic" }, -- Change the style of comments
   --         conditionals = { "italic" },
   --         loops = {},
   --         functions = {},
   --         keywords = {},
   --         strings = {},
   --         variables = {},
   --         numbers = {},
   --         booleans = {},
   --         properties = {},
   --         types = {},
   --         operators = {},
   --         -- miscs = {}, -- Uncomment to turn off hard-coded styles
   --     },
   --     color_overrides = {},
   --     custom_highlights = {},
   --     default_integrations = true,
   --     integrations = {
   --         cmp = true,
   --         gitsigns = true,
   --         nvimtree = true,
   --         treesitter = true,
   --         notify = false,
   --         mini = {
   --             enabled = true,
   --             indentscope_color = "",
   --         },
   --         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
   --     },
   -- })
   -- -- setup must be called before loading
   -- vim.cmd.colorscheme "catppuccin"

   require 'nordic'.setup {
       -- This callback can be used to override the colors used in the palette.
       on_palette = function(palette) return palette end,
       -- Enable bold keywords.
       bold_keywords = false,
       -- Enable italic comments.
       italic_comments = true,
       -- Enable general editor background transparency.
       transparent_bg = true,
       -- Enable brighter float border.
       bright_border = false,
       -- Reduce the overall amount of blue in the theme (diverges from base Nord).
       reduced_blue = true,
       -- Swap the dark background with the normal one.
       swap_backgrounds = false,
       -- Override the styling of any highlight group.
       override = {
           Visual = { bg = "#3f4551" },
       },
       -- Cursorline options.  Also includes visual/selection.
       cursorline = {
           -- Bold font in cursorline.
           bold = false,
           -- Bold cursorline number.
           bold_number = true,
           -- Available styles: 'dark', 'light'.
           theme = 'dark',
           -- Blending the cursorline bg with the buffer bg.
           blend = 0.85,
       },
       noice = {
           -- Available styles: `classic`, `flat`.
           style = 'classic',
       },
       telescope = {
           -- Available styles: `classic`, `flat`.
           style = 'flat',
       },
       leap = {
           -- Dims the backdrop when using leap.
           dim_backdrop = false,
       },
       ts_context = {
           -- Enables dark background for treesitter-context window
           dark_background = true,
       }
   }

    require 'nordic' .load()

    require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = { "python", "go", "c", "vim", "lua", "html", "css", "php", "rust", "nix" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (or "all")
    ignore_install = { "javascript" },

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        disable = {"markdown"},
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    }


    -- live saver no fkng annoying retared messges
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end


    require("lsp_signature").on_attach(
        {
            bind = true,
            fix_pos = true,
            handler_opts = {
                border = "single"
            }
        }
    )

EOF



"
let g:diagnostic_enable_virtual_text = 0

set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'
let g:echodoc#highlight_identifie = 'EchoDoc'

let g:doge_doc_standard_python = 'google'

let g:doge_mapping_comment_jump_forward = '<c-j>'
let g:doge_mapping_comment_jump_backward = '<c-k>'

" Trigger completion with <Tab>
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

let g:completion_enable_snippet = 'UltiSnips'

" -----------------------------------------------------------------------------------------------------------------------------
" KEY BINDS / MAPPINGS
" -----------------------------------------------------------------------------------------------------------------------------

set lazyredraw
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

nnoremap dR :diffget RE<CR>
nnoremap dL :diffget LO<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-j> <C-W><C-J>
nnoremap <C-d> <C-W><C-J>
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
" leader key binds
let mapleader = " "

vnoremap <leader>p "_dP
nnoremap <leader>l :lopen<CR>

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
nnoremap <leader>r : so ~/.config/nvim/init.vim<cr>:call UltiSnips#RefreshSnippets()<cr>
noremap <leader>u :w<Home>silent <End> !urlview<CR>

noremap <F4> :TagbarToggle<CR>
" noremap <F3> :ALEFix<CR>
""Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

nnoremap <F2> :exec '!python' shellescape(@%, 1)<cr>
"          noremap <F3> :ALEFix black<CR>

nnoremap <silent> <leader>G :LazyGit<CR>

command! WQ wq
command! Wq wq
command! Wa wa
command! WA wa
command! W w
command! Q q

let g:doge_mapping = '<c-d>'

" -----------------------------------------------------------------------------------------------------------------------------
" VIM SETTINGS
" -----------------------------------------------------------------------------------------------------------------------------

"" Live substitute (neovim)
set inccommand=split
syntax on
filetype plugin on

set encoding=utf-8
" set showtabline=2
set number
set clipboard+=unnamedplus
set noswapfile
set nobackup

set laststatus=2                                " always show the statusline

set conceallevel=2
set foldmethod=marker
set rtp^=~/.config/nvim
set mouse=a                                    " disable mouse
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
" let g:deoplete#enable_at_startup = 1
" inoremap <expr> <C-n>  deoplete#manual_complete()

"
"
" call deoplete#custom#source('_', 'max_menu_width', 80)
"use TAB as the mapping
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ?  "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ deoplete#mappings#manual_complete()
" function! s:check_back_space() abort ""
"   let col = col(.) - 1
"   return !col || getline(.)[col - 1]  =~ s
" endfunction ""
"
" inoremap <silent><expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
" inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
" inoremap <silent><expr> <TAB>
" \ pumvisible() ? "\<C-n>" :
" \ <SID>check_back_space() ? "\<TAB>" :
" \ deoplete#manual_complete()
" function! s:check_back_space() abort
" let col = col('.') - 1
" return !col || getline('.')[col - 1]  =~ '\s'
" endfunction
" ------
" Language client
" ------
" let g:LanguageClient_diagnosticsSignsMax = 100
" let g:LanguageClient_diagnosticsEnable = 0
" let g:LanguageClient_changeThrottle = 0.5
" let g:LanguageClient_settingsPath = "~/.config/nvim/settings.json"
" let g:LanguageClient_hasSnippetSupport = 1
" let g:LanguageClient_hoverPreview = 'Always'
" let g:LanguageClient_serverCommands = {
"    \ 'python': ['pyls', '-vv', '--log-file', '/tmp/pyls.log'],
"    \ 'c': ['clangd'],
"    \ 'cpp': ['clangd'],
"    \ 'go': ['gopls', "-vv", "-logfile", "/tmp/gopls.log"],
"    \ 'clojure': ['bash', '-c', 'clojure-lsp'],
"    \ 'json': ['json-languageserver', '--stdio'],
"    \ 'html': ['html-languageserver', '--stdio'],
"    \ 'css': ['css-languageserver', '--stdio'],
"    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
"    \ 'javascript': ['node', '/home/sevaho/.nvm/versions/node/v12.9.1/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio'],
"    \ 'typescript': ['node', '/home/sevaho/.nvm/versions/node/v12.9.1/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio'],
"    \ }

" \ 'python':     ['mspyls'],
" \ 'go': ['/home/sevaho/.go/bin/go-langserver'],
" autocmd BufWritePre *.go :ALEFix
"
" autocmd BufReadPost *.rs setlocal filetype=rust

" let g:LanguageClient_loggingFile = '/tmp/lc.log'
" let g:LanguageClient_loggingLevel = 'DEBUG'

" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> grn :call LanguageClient#textDocument_rename()<CR>
"
" nnoremap <silent> gD :call LanguageClient#textDocument_definition({'gotoCmd': 'vsplit'})<CR>zz
" nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
" nnoremap <silent> gx :call LanguageClient_contextMenu()<CR>
" nnoremap <leader>rn :call LanguageClient#textDocument_rename()<CR>
" " nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
" nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
" nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
" nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
"
" let g:LanguageClient_diagnosticsList = "Location"

" ------
" ncm2
" ------
" autocmd BufEnter * call ncm2#enable_for_buffer()
"
" au TextChangedI * call ncm2#auto_trigger()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"
"" Enable entering when popup is visible
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Enable scrolling via tab
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"
" inoremap <expr> <c-l> pumvisible() ? ncm2_ultisnips#expand_or("\<CR>", 'n') : "\<CR>"
"
" inoremap <silent> <expr> <CR> ((pumvisible() && empty(v:completed_item)) ?  "\<c-y>\<cr>" : (!empty(v:completed_item) ? ncm2_ultisnips#expand_or("", 'n') : "\<CR>" ))
"i noremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
"
" " inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
" augroup ncm2
"
"     autocmd BufEnter * call ncm2#enable_for_buffer()
"     " autocmd TextChangedI * call ncm2#auto_trigger()
"
" augroup end
" "
" " " IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=menuone,noselect
" set completeopt-=preview
"
" "
" let g:ncm2#popup_delay = 211
" let g:ncm2#complete_delay = 61
" let g:ncm2#popup_limit = 21
" let g:ncm2#total_popup_limit = 41
" "
" let g:UltiSnipsRemoveSelectModeMappings = 1
" " inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
"
" " inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" inoremap <expr> <C-Tab> ncm2#complete()
"
" inoremap <expr> <Plug>(cr_prev) execute('let g:_prev_line = getline(".")')
" inoremap <expr> <Plug>(cr_do) (g:_prev_line == getline('.') ? "\<cr>" : "")
" inoremap <expr> <Plug>(cr_post) execute('unlet g:_prev_line')
"
" imap <expr> <CR> (pumvisible() ? "\<Plug>(cr_prev)\<C-Y>\<Plug>(cr_do)\<Plug>(cr_post)" : "\<CR>")

" NCM2

" let g:ncm2#popup_delay = 100
" let g:ncm2#complete_delay = 61
" let g:ncm2#popup_limit = 21
" let g:ncm2#total_popup_limit = 41
"
" let g:UltiSnipsRemoveSelectModeMappings = 1
" inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
" inoremap <expr> <C-Tab> ncm2#complete()
"
" let g:UltiSnipsExpandTrigger		= "<tab>"
" let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
" let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
" inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

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
let g:ale_linter_aliases = {'svelte': ['css', 'javascript']}
let g:ale_linters = {'*': ['remove_trailing_lines', 'trim_whitespace'],'python': ['flake8', 'pyflakes', 'pycodestyle', 'pyre', 'mypy', 'isort', 'remove_trailing_lines', 'trim_whitespace'], 'svelte': ['eslint','stylelint', 'remove_trailing_lines', 'trim_whitespace'],'typescript': ['eslint'], 'javascript': ['eslint','stylelint', 'remove_trailing_lines', 'trim_whitespace'], 'yaml': ['yamllint'], 'go': ['golangci_lint', 'gofumpt', 'govet', 'staticcheck', 'gopls'], 'rust': ['clippy'], 'clojure': ['joker'], 'xml': ['xmllint'], 'html': ['prettier', 'eslint']}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['isort', 'black'],'svelte': ['prettier', 'eslint', 'remove_trailing_lines', 'trim_whitespace'], 'javascript': ['prettier', 'eslint', 'remove_trailing_lines', 'trim_whitespace'], 'go': ['gofmt', 'goimports'], 'markdown': ['remark'], 'sql': ['pgformatter'], 'rust': ['rustfmt'],'typescript': ['prettier', 'eslint'], 'xml': ['xmllint'], 'html': ['tidy']}
let g:ale_python_autoflake_options = '--expand-star-imports --remove-all-unused-imports --remove-unused-variables --remove-duplicate-keys -s'
let g:ale_xml_xmllint_options = '-format'
let ale_xml_xmllint_options = '-format'
let g:ale_html_tidy_options = '-i'
let g:ale_go_gofmt_options = '-s'
let g:ale_rust_clippy_options = '--all-targets --all-features -- -D warnings'
let g:ale_python_black_options = '-S -l 120'
let g:ale_python_isort_options = '-w 120'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '!'
let g:ale_sign_warning = '*'
let g:ale_fix_on_save = 0
" Write this in your vimrc file
" let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
" let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'P'
let g:ale_echo_msg_format = '[ALE %linter%] %s [%severity%]'

highlight ALEErrorSign ctermbg=red ctermfg=white
highlight ALEWarningSign ctermbg=blue ctermfg=white


" NERDTREE
"
" function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
" exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
" endfunction

" call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('', 'yellow', 'none', 'yellow', '#151515')
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
" let g:tagbar_width = 45


" airline
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_theme='bubblegum'
let g:airline#extensions#ale#enabled = 0

let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#tagbar#enabled = 0

set shell=zsh

" CLOSETAG
let g:closetag_filenames = '*.html,*.php,*.phtml,*.jinja,*.php'

"
" -----------------------------------------------------------------------------------------------------------------------------
" AUTOCMDS
" -----------------------------------------------------------------------------------------------------------------------------

augroup autocmds
    au BufRead /tmp/psql.edit.* set syntax=sql
    noremap <F3> :ALEFix<CR>
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
        noremap <F3> :ALEFix<CR>
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
    autocmd BufNewFile,BufRead *.svelte set filetype=html
"
    " disables keybindings when focussing on nerdtree
    autocmd FileType nerdtree noremap <buffer> <s-f> <nop>
    autocmd FileType nerdtree noremap <buffer> <s-m> <nop>

    " autocmd VimResized * :wincmd =
"
augroup END

" Resize windows using arrow keys
noremap <up>    <C-W>+
noremap <down>  <C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-j> <C-W><C-J>
nnoremap <C-d> <C-W><C-J>
