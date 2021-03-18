"VIM Configuration
"=================
syntax on

"File Type Plugin (ftplugin)
filetype plugin indent on

set wm=0 "wrapmargin disabled
set nowrap

"Line numbering
set relativenumber
set nu

set hlsearch "highlight search
set incsearch "incremental search

set colorcolumn=80 "mark a line on col.80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set sc "showcmd

set noerrorbells

set tabstop=8 "TAB size
set softtabstop=4
set shiftwidth=4 "<< and >> operations
set expandtab "right spaces when pressing TAB in insert mode

"nnoremap <Tab> >>_
"nnoremap <S-Tab> <<_       "No permeten [count]
inoremap <S-Tab> <C-D>

set smartindent
set smartcase

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

"Spell checking
set spelllang=en,es,ca
"set spell

"Autocomplete .(buffer), w(windows), b(buffers), u(unloaded buffers), t(TAGS),
"i(#include), kspell(dict)
set complete=.,w,b,u,t,i,kspell


let mapleader = " " "SPC to enter command mode

nnoremap <leader>u :UndotreeShow<CR>

"Buffers
nnoremap <Leader>b :buffers<CR>:buffer<SPACE>

"Windows
"v: vertical split
"s: horizontal split
"c: close window
"o: only
"h/j/k/l: movement
nnoremap <Leader>w <c-w>
nnoremap <Leader>w+ :res +5<CR>
nnoremap <Leader>w- :res -5<CR>

nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

"project-view and project-search
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30 <CR>
nnoremap <Leader>ps :Rg<SPACE>

"YCM (the best part)
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>


"PLUGINS
"=======

"Require installation of https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

"Plug 'Valloric/YouCompleteMe' "autocomplete
"Require to do:
"cd .vim/plugged/YouCompleteMe
"python3 install.py --all
if has('patch-8.1.2269')
    " Latest YCM needs at least this version of vim
    Plug 'ycm-core/YouCompleteMe'
else
    " Version compatible with the vim in Debian 10 buster
    Plug 'ycm-core/YouCompleteMe', { 'commit':'d98f896' }
endif

Plug 'morhetz/gruvbox' "color skin
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'srcery-colors/srcery-vim'

Plug 'jremmen/vim-ripgrep' "very fast grep
Plug 'tpope/vim-fugitive' "git
Plug 'vim-utils/vim-man' "man pages
Plug 'kien/ctrlp.vim' "C-p file finding
Plug 'mbbill/undotree'

"Programming languages
Plug 'lyuts/vim-rtags' "C++
Plug 'godlygeek/tabular' "Markdown
Plug 'plasticboy/vim-markdown' "Markdown

"Other features
Plug 'jceb/vim-orgmode' "Emacs ORG mode
Plug 'tpope/vim-speeddating' "C-a and C-x over dates
Plug 'vim-airline/vim-airline' "AirlineToggle to disable
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"packloadall
"silent! helptags ALL

colorscheme gruvbox
"colorscheme sublimemonokai
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"let g:ctrlp_use_caching = 0

let g:netrw_browse_split = 2
let g:netrw_banner = 0 "disable autocomplete help (for built-ins) "disable autocomplete help (for built-ins)

"Airline
let g:airline_detect_spell=1
let g:airline_detect_spelllang=1

let g:airline_theme='gruvbox'
"let g:airline_theme='minimalist' 
"let g:airline_theme='lighthaus'

let g:airline_powerline_fonts=1
let g:airline_powerline_symbols=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = '%%' "
"let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ' ㏑'
let g:airline_symbols.dirty='⚡'
