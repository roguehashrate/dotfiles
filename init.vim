" Colemak-friendly basic vim config
" RogueHashrate's Config

" Vim-Plug Plugins
call plug#begin('~/.vim/plugged')
 Plug 'preservim/nerdtree'
 Plug 'vim-crystal/vim-crystal'
 Plug 'itchyny/lightline.vim'
 Plug 'junegunn/fzf.vim'
 Plug 'Raimondi/delimitMate'
 Plug 'tpope/vim-fugitive'
 Plug 'suan/vim-instant-markdown'
 Plug 'psliwka/vim-smoothie'
 Plug 'arcticicestudio/nord-vim'
 Plug 'williamboman/mason.nvim'
 Plug 'williamboman/mason-lspconfig.nvim'
 Plug 'hrsh7th/nvim-cmp'
 Plug 'hrsh7th/cmp-nvim-lsp'
 Plug 'neovim/nvim-lspconfig'
 Plug 'ziglang/zig.vim'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim'
call plug#end()

" LSP zig
lua << EOF
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {}, -- don't auto-install zls
})

require("lspconfig").zls.setup {
  cmd = { "zls" }, -- uses your system's /usr/bin/zls
}
EOF

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

" System copy-paste
vnoremap y "+y
nnoremap y "+y

nnoremap p "+p
vnoremap p "+p

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
colorscheme nord

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

" Telescope bindings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Telescope stay in the same dir unless given a full dir path
lua << EOF
require('telescope').setup{
  defaults = {
    cwd = vim.fn.getcwd(),  -- Always use the current directory
    -- optional: disable preview pane
    previewer = false,
    -- optional: use dropdown layout
    layout_strategy = 'vertical',
  }
}
EOF

" Lightline
let g:lightline = {
  \ 'colorscheme': 'nord',
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
