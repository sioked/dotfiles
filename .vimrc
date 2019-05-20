call plug#begin('~/.vim/plugged')

"Sensible defaults
Plug 'tpope/vim-sensible'

"Nova color scheme
Plug 'trevordmiller/nova-vim'
" Plug 'zanglg/nova.vim'
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
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'mxw/vim-jsx'
Plug 'elmcast/elm-vim'
Plug 'leafgarland/typescript-vim'
Plug 'flowtype/vim-flow'
Plug 'tomlion/vim-solidity'
Plug 'tmux-plugins/vim-tmux'
Plug 'jparise/vim-graphql'

"Search plugins
Plug 'mileszs/ack.vim'

"Supertab will help with autocomplete
"Plug 'ervandew/supertab'

"delimitMate auto closes brackets, etc
Plug 'Raimondi/delimitMate'

"Rest console
Plug 'diepm/vim-rest-console'

"Autocompletion
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'Quramy/tsuquyomi'

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

" Snippets plugin
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'epilande/vim-react-snippets'

" vim-tmux-navigator - allows seamless navigation between windows in vim and
" panes in tmux
" Plug 'christoomey/vim-tmux-navigator'

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

" colorscheme one
" set background=dark
colorscheme nova
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
" Use j k key command to exit insert mode
inoremap jk <esc>
" Enable jsx syntax highlighting in javascript files
let g:jsx_ext_required = 0

"Delimitmate - Enable matching pairs for brackets and arrows
let delimitMate_matchpairs = "(:),[:],{:},<:>"
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
" Remapping this- something was conflicting with it previously
imap <S-Tab> <Plug>delimitMateS-Tab

"Configs for powerline
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

"Airline (powerline alt)
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'

" Auto-save sessions 
function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

" Adding automatons for when entering or leaving Vim
" Only if no arguments passed in
if(argc() == 0)
  au VimEnter * nested :call LoadSession()
  autocmd VimLeave * NERDTreeClose
  autocmd VimLeave * :call MakeSession()
endi

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
let g:ctrlp_lazy_update=100
let g:ctrlp_show_hidden=0
let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
" let g:ctrlp_working_path_mode = "ra"
" let g:ctrlp_custom_ignore = {
"     \ 'dir':    '\v[\/](\.(git|hg|svn)|node_modules|bower_components|target|build|dist)$',
"     \ 'file':   '',
"     \ 'link':   '',
"     \ }

" Ack/Ag
let g:ackprg = 'ag --nogroup --nocolor --column'
cnoreabbrev Ack Ack!

" ALE Fixers
let g:ale_fixers = {
\   'javascript': [
\       'eslint'
\   ],
\   'javascript.jsx': [
\       'eslint'
\   ],
\   'typescript': [
\       'tslint'
\   ],
\}

let g:ale_linters = {
\   'typescript': [
\       'tslint',
\       'prettier',
\       'tsserver',
\   ],
\}
" ALE navigate between errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" NerdCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" Keep selected text when indenting
vnoremap < <gv
vnoremap > >gv


" Snippets config - use C-l to select a snippet
let g:UltiSnipsExpandTrigger="<C-l>"

" Remap C-s to increment a number under cursor (normally C-a)
nnoremap <C-s> <C-a>

" Save files on focus lost
au FocusLost * silent! wa

inoremap <silent><expr> <c-space> coc#refresh()

" Close any hidden buffers
" Call this with `:call Wipeout()`
function! Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction

" Zoom / Restore window.
" Currently mapped to C-w z
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

let g:coc_global_extensions = ['coc-emoji', 'coc-tsserver', 'coc-prettier']
