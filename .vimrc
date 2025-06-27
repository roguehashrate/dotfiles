" Colemak-friendly basic vim config
" RogueHashrate's Config

" Vim-Plug Plugins
call plug#begin('~/.vim/plugged')
 Plug 'preservim/nerdtree'
 Plug 'vim-crystal/vim-crystal'
 Plug 'ghifarit53/tokyonight-vim'
 Plug 'itchyny/lightline.vim'
 Plug 'junegunn/fzf.vim'
 Plug 'Raimondi/delimitMate'
 Plug 'tpope/vim-fugitive'
 Plug 'suan/vim-instant-markdown'
 Plug 'psliwka/vim-smoothie'



call plug#end()


" Remap movement keys (normal mode)
nnoremap n h
nnoremap e j
nnoremap i k
nnoremap o l

" Remap movement keys (visual mode)
vnoremap n h
vnoremap e j
vnoremap i k
vnoremap o l

" Remap movement keys (operator-pending mode)
onoremap n h
onoremap e j
onoremap i k
onoremap o l

" Use 'gi' to enter insert mode
nnoremap gi i

" Leader key setup (space)
let mapleader = " "

" Remap NERDTree navigation keys for Colemak (neio)
autocmd FileType nerdtree nnoremap <buffer> n h
autocmd FileType nerdtree nnoremap <buffer> e j
autocmd FileType nerdtree nnoremap <buffer> i k
autocmd FileType nerdtree nnoremap <buffer> o l

" Window navigation with leader + neio
nnoremap <leader>n <C-w>h
nnoremap <leader>e <C-w>j
nnoremap <leader>i <C-w>k
nnoremap <leader>o <C-w>l

" NerdTree Keys
nnoremap <leader>t :NERDTreeToggle<CR>

" Enable line numbers
set number

" Enable syntax highlighting and theme
syntax on
set termguicolors
set background=dark
colorscheme tokyonight

" Transparent background
highlight Normal ctermbg=none guibg=NONE
highlight NonText ctermbg=none guibg=NONE
highlight LineNr ctermbg=none guibg=NONE
highlight EndOfBuffer ctermbg=none guibg=NONE
highlight SignColumn ctermbg=none guibg=NONE
highlight VertSplit ctermbg=none guibg=NONE

" File type detection
filetype plugin indent on

" Basic settings
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a

" Split window horizontally (top/bottom) with <leader>-s
nnoremap <leader>s :split<CR>

" Split window vertically (left/right) with <leader>v
nnoremap <leader>v :vsplit<CR>

" Close current pane with <leader>c
nnoremap <leader>c :close<CR>

" Pane navigation (move cursor between panes)
nnoremap <leader>n <C-w>h
nnoremap <leader>e <C-w>j
nnoremap <leader>i <C-w>k
nnoremap <leader>o <C-w>l

" Pane resizing (use different leader combos, e.g. leader + Shift + neio)
nnoremap <leader>N :vertical resize -2<CR>
nnoremap <leader>E :resize +2<CR>
nnoremap <leader>I :resize -2<CR>
nnoremap <leader>O :vertical resize +2<CR>

" Use lightline statusline
set laststatus=2       " Always show statusline
set noshowmode         " Lightline shows mode

let g:lightline = {
  \ 'colorscheme': 'tokyonight',
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \ },
  \ 'component': {
  \   'left': [ ['mode'], ['gitbranch', 'readonly', 'filename', 'modified'] ],
  \   'right': [ ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'] ],
  \ },
  \ 'enable': {
  \   'tabline': 1,
  \ },
  \ }

" Refresh lightline on git events
autocmd User FugitiveIndexChanged,User FugitiveStatusChanged,User FugitiveFileChanged call lightline#update()
