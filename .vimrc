call plug#begin('~/.vim/plugged')

"Sensible defaults
Plug 'tpope/vim-sensible'

"Solarized Color Scheme
Plug 'lifepillar/vim-solarized8'
Plug 'rakr/vim-one'

"NerdTree
Plug 'scrooloose/nerdtree'

"Syntastic
Plug 'vim-syntastic/syntastic'

"CTRLP - Fuzzy search
Plug 'ctrlpvim/ctrlp.vim'

"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Syntaxes
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'mxw/vim-jsx'
Plug 'elmcast/elm-vim'
Plug 'leafgarland/typescript-vim'
Plug 'flowtype/vim-flow'

"Search plugins
Plug 'mileszs/ack.vim'

"Supertab will help with autocomplete
Plug 'ervandew/supertab'

"delimitMate auto closes brackets, etc
Plug 'Raimondi/delimitMate'

"Rest console
Plug 'diepm/vim-rest-console'

call plug#end()



syntax on
filetype plugin indent on

if (has("termguicolors"))
  set termguicolors
endif

colorscheme one
set background=dark
set nocompatible
set shiftwidth=2
set tabstop=2
set expandtab
set textwidth=0
set encoding=utf-8
set fillchars+=vert:\

set smartindent
set copyindent
set preserveindent

set number

set nobackup
set nowritebackup
set noswapfile
set undolevels=1000
set updatecount=100

"Configs for powerline
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

"Airline (powerline alt)
let g:airline_powerline_fonts = 1
let g:airline_theme='one'

" nerdtree configs
let NERDTreeQuitOnOpen=0
map <C-\> :NERDTreeToggle<CR>
map <C-n> :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ctrlp configs
set wildignore+=*.so,*.swp,*.zip,*.class,*.jar
let g:ctrlp_working_path_mode = "ra"
let g:ctrlp_custom_ignore = {
    \ 'dir':    '\v[\/](\.(git|hg|svn)|node_modules|bower_components|target)$',
    \ 'file':   '',
    \ 'link':   '',
    \ }

" Syntastic
autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc', '.;') != '' ? ['eslint'] : ['standard']
autocmd FileType javascript let b:syntastic_javascript_eslint_exec = '`npm bin`/eslint'

let g:jsx_ext_required = 0
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype json setlocal ts=2 sts=2 sw=2

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Ack/Ag
let g:ackprg = 'ag --nogroup --nocolor --column'
