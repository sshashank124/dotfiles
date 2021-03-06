" PLUGINS
call plug#begin('~/.local/share/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'rstacruz/vim-closer'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" CORE
filetype plugin indent on   " enable filetype plugins
syntax on   " enable syntax highlighting
if has('mouse') | set mouse=a | endif   " enable mouse support
set encoding=utf8
set ffs=unix,dos,mac   " use Unix as the standard file type
set nobackup nowb noswapfile   " no backups
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set guicursor=   " don't change default cursor
set wildignore=*.o,*~,*.pyc   " ignore compiled files
set wildignore+=.git\*,.hg\*,.svn\*,*/target/*   " ignore vcs files
set tm=500   " timeout length for mapped sequences
"" neovim
let g:loaded_python_provider = 0
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0

" LSP
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> K <cmd>call CocActionAsync('doHover')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gt <Plug>(coc-references)
nmap <silent> gr <Plug>(coc-rename)
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)

" UI
set background={{ colors.mode }}
set cursorline   " highlight current line
hi CursorLineNr cterm=bold ctermfg=1|   " red current line number color
hi CursorLine cterm=bold ctermbg=8|   " dark gray bg color
augroup CursorLine   " only highlight current line in active buffer/window
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
hi VertSplit cterm=none ctermbg=8 ctermfg=8|   " dark gray vertical split
hi SignColumn ctermbg=0|   " no bg on signs gutter
hi Pmenu cterm=none ctermbg=8 ctermfg=7
hi PmenuSel cterm=bold ctermbg=0 ctermfg=10
hi PmenuSbar ctermbg=8
hi PmenuThumb ctermbg=0
hi CocErrorSign ctermfg=1
hi CocWarningSign ctermfg=3
hi CocInfoSign ctermfg=5
hi CocHintSign ctermfg=4
set number relativenumber   " relative line numbers except current line
set showtabline=2
"" lightline+bufferline
let g:lightline                  = {}
let g:lightline.colorscheme      = 'system'
let g:lightline.tabline          = {'left': [['buffers']], 'right': [[]]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

" MOVEMENT
set whichwrap+=<,>,h,l   " wrap movement on lines
noremap 0 ^|   " 0 jumps to first non-whitespace char
noremap ^ 0|   " ^ jumps for column 0

" VIEWING
set scrolloff=4   " line padding when scrolling
set lbr tw=500   " linebreak on 500 characters
set wrap   " wrap off-screen lines
set lazyredraw   " no redraw on macros
set showmatch   " show bracket pair for bracket under cursor

" COMMANDS
nmap ; :

" EDITING
set expandtab ts=2 sw=2 sts=2 smarttab   " tab = 2 spaces
noremap <a-w> <cmd>update<cr>|   " save changes
noremap <a-q> <cmd>quit<cr>|   " quit
inoremap jk <esc>|   " easier escape
nnoremap Q @q|   " quick default macro
vnoremap Q <cmd>norm @q<cr>|   " run macro on selected lines
nnoremap Y y$|   " make Y behave similarly to C and D

" SEARCHING
set ignorecase smartcase   " a matches (a or A) but A only matches A
set magic   " regex magic
set inccommand=nosplit

" WINDOWS
set splitbelow splitright   " new windows below and to the right
function! WinMove(key)   " smart way to move between windows
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]')) | wincmd v | else | wincmd s | endif
    exec "wincmd ".a:key
  endif
endfunction
noremap <a-h> <cmd>call WinMove('h')<cr>|   " window to left or new
noremap <a-j> <cmd>call WinMove('j')<cr>|   " window below or new
noremap <a-k> <cmd>call WinMove('k')<cr>|   " window above or new
noremap <a-l> <cmd>call WinMove('l')<cr>|   " window to right or new
noremap <a-s-h> <c-w><|   " shrink window horizontally
noremap <a-s-j> <c-w>+|   " grow window vertically
noremap <a-s-k> <c-w>-|   " shrink window vertically
noremap <a-s-l> <c-w>>|   " grow window horizontally

" BUFFERS
set hidden   " hide buffers instead of closing on navigating away
noremap <a-a> <cmd>bp<cr>|   " prev buffer
noremap <a-s> <cmd>bd<cr>|   " delete buffer
noremap <a-d> <cmd>bn<cr>|   " next buffer

" TERMINAL
nnoremap <a-cr> <cmd>terminal<cr>
autocmd BufEnter,TermOpen term://* startinsert   " enter term in insert mode
