call plug#begin('~/.vim/plugged')

"Sensible defaults
Plug 'tpope/vim-sensible'

"Solarized Color Scheme
Plug 'lifepillar/vim-solarized8'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'

"NerdTree
Plug 'scrooloose/nerdtree'

"Commenter - Use <Leader>cc to comment, <Leader>cu to uncomment
Plug 'scrooloose/nerdcommenter'

"Ale (syntax checker)
Plug 'w0rp/ale'

"CTRLP - Fuzzy search - Use c-p to open the search, c-o to prompt to open in a
"new split
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
Plug 'tomlion/vim-solidity'
Plug 'tmux-plugins/vim-tmux'

"Search plugins
Plug 'mileszs/ack.vim'

"Supertab will help with autocomplete
Plug 'ervandew/supertab'

"delimitMate auto closes brackets, etc
Plug 'Raimondi/delimitMate'

"Rest console
Plug 'diepm/vim-rest-console'

"Autocompletion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Terminus - Mouse support, cursors when in different modes, etc
Plug 'wincent/terminus'

" EasyMotion - for moving through the file easier use <Leader><Leader>s to
" search for character, or <Leader><Leader>w to navigate to words
Plug 'easymotion/vim-easymotion'

" Surround - For handling modifications in surround - use cs' or cst or cs{ to
" change surrounding items
Plug 'tpope/vim-surround'

" Prettier - will make javascript/typescript/graphql files pretty
" post install (yarn install | npm install) then load plugin only for editing supported files
" Use with <Leader>p to prettify a file
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

call plug#end()

syntax on
filetype plugin indent on

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
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
set cursorcolumn
set cursorline

set number

set nobackup
set nowritebackup
set noswapfile
set undolevels=1000
set updatecount=100
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list

" Open new splits below or to the right (more natural)
set splitbelow
set splitright

"Preferences
inoremap jk <esc>

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
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=0
map <C-\> :NERDTreeToggle<CR>
map <C-n> :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open NerdTree by default
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ctrlp configs
set wildignore+=*.so,*.swp,*.zip,*.class,*.jar
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = "ra"
let g:ctrlp_custom_ignore = {
    \ 'dir':    '\v[\/](\.(git|hg|svn)|node_modules|bower_components|target|build)$',
    \ 'file':   '',
    \ 'link':   '',
    \ }

" Ack/Ag
let g:ackprg = 'ag --nogroup --nocolor --column'

" ALE Fixers
let g:ale_fixers = {
\   'javascript': [
\       'eslint'
\   ]
\}
" ALE navigate between errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Switching between buffers
map <Tab> :bnext<CR>
map <S-Tab> :bprevious<CR>

" NerdCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" Keep selected text when indenting
vnoremap < <gv
vnoremap > >gv
