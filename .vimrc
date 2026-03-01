" Minimal vimrc - no plugins
" For full-featured editing use nvim

syntax on
filetype plugin indent on

" True color
if has('termguicolors')
  set termguicolors
endif

colorscheme desert

" Basic settings
set nocompatible
set encoding=utf-8
set number
set relativenumber
set cursorline
set cursorcolumn
set updatetime=300
set signcolumn=yes
set textwidth=0

" Indentation
set shiftwidth=2
set tabstop=2
set expandtab

" No backup / swap
set nobackup
set nowritebackup
set noswapfile
set undolevels=1000

" Whitespace display
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list

" Open splits below and to the right
set splitbelow
set splitright

" Save on focus lost
au FocusLost * silent! wa

" Escape shortcuts (match nvim config)
inoremap jk <Esc>
inoremap kj <Esc>
inoremap jj <Esc>

" Keep visual selection when indenting
vnoremap < <gv
vnoremap > >gv

" Remap C-s to increment (C-a conflicts with tmux prefix)
nnoremap <C-s> <C-a>

" Zoom / restore current window (C-w z)
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-w>z :ZoomToggle<CR>
