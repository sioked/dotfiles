call plug#begin('~/.vim/plugged')

"Sensible defaults
Plug 'tpope/vim-sensible'

"Nova color scheme
Plug 'trevordmiller/nova-vim'
" Plug 'zanglg/nova.vim'
"NerdTree - use <ctrl-\> to open
Plug 'scrooloose/nerdtree'

"Commenter - Use <Leader>cc to comment, <Leader>cu to uncomment
Plug 'scrooloose/nerdcommenter'

"Ale (syntax checker)
Plug 'w0rp/ale'

"CTRLP - Fuzzy search - Use c-p to open the search, c-o to prompt to open in a
"new split
" Plug 'ctrlpvim/ctrlp.vim'

" Scratch plugin
"gs opens scratch window
"gs in visual mode copies selected text into scratch window
Plug 'mtth/scratch.vim'

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
Plug 'ianks/vim-tsx'
Plug 'elixir-editors/vim-elixir'

"Search plugins
Plug 'mileszs/ack.vim'

"delimitMate auto closes brackets, etc
Plug 'Raimondi/delimitMate'

"Rest console
"Plug 'diepm/vim-rest-console'

"Autocompletion
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

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
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/1.x' }

" Snippets plugin
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'epilande/vim-react-snippets'

" vim-tmux-navigator - allows seamless navigation between windows in vim and
" panes in tmux
" Plug 'christoomey/vim-tmux-navigator'

" fzf (fuzzy finder) for searching files and other stuff
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Tabular - Align text
Plug 'godlygeek/tabular'

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

" Update gutter styles
" highlight SignColumn guibg=#899BA6
highlight SignColumn guibg=NONE

set number
set relativenumber

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
"set term=xterm-256color
set termencoding=utf-8

"Airline (powerline alt)
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'
"Fix for error when using terminal
let R_setwidth=0
let R_clear_line=0

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
" set wildignore+=*.so,*.swp,*.zip,*.class,*.jar
" let g:ctrlp_lazy_update=100
" let g:ctrlp_show_hidden=0
" let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
" let g:ctrlp_working_path_mode = "ra"
" let g:ctrlp_custom_ignore = {
"     \ 'dir':    '\v[\/](\.(git|hg|svn)|node_modules|bower_components|target|build|dist)$',
"     \ 'file':   '',
"     \ 'link':   '',
"     \ }

" Ack/Ag
let g:ackprg = 'ag --nogroup --nocolor --column'
cnoreabbrev Ack Ack!

" ALE config
let g:ale_change_sign_column_color=0
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
\   'ruby': [
\       'rubocop'
\   ],
\}

let g:ale_linters = {
\   'typescript': [
\       'tslint',
\       'prettier',
\       'tsserver',
\   ],
\   'ruby': ['rubocop']
\}
" ALE navigate between errors
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

" NerdCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" Keep selected text when indenting
vnoremap < <gv
vnoremap > >gv


" Snippets config - use C-l to select a snippet
let g:UltiSnipsExpandTrigger="<C-l>"

" Remap C-s to increment a number under cursor (normally C-a, conflicts with
" tmux)
nnoremap <C-s> <C-a>

" Save files on focus lost
au FocusLost * silent! wa

" Coc Configs
" Use <c-space> to trigger completion.
set updatetime=300
set signcolumn=yes
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')


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
tmap <C-w>z <C-w>N <bar> :ZoomToggle<CR>

" coc configs!
" Support for some extensions
let g:coc_global_extensions = ['coc-emoji', 'coc-tsserver', 'coc-prettier', 'coc-ultisnips', 'coc-elixir']
" Use Ctrl-j and Ctrl-k to go navigate to issues
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use tab for trigger completion with characters ahead and navigate.
" " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" <CR> to confirm completion, use: >
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" use :Format to format current buffer
command! -nargs=0 Format :call CocAction('format')

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
imap <silent> <C-x><C-u> <Plug>(coc-complete-custom)

"remap <C-r> to allow pasting in terminal
tnoremap <expr> <C-r> '<C-w>"'.nr2char(getchar()).'pi'

" Scratch configs
" Use gs to open the scratch pad
let g:scratch_horizontal=0
let g:scratch_top=0
let g:scratch_persistence_file='.scratch.md'
let g:scratch_filetype='markdown'

" Fzf configs
" Make sure Ag does not look at the filenames when searching
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

map <C-p> :Files<CR>
