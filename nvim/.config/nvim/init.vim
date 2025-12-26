"──────────────────────────────────────────────────────────────────────────────
" Plugin Manager Initialization
"──────────────────────────────────────────────────────────────────────────────
call plug#begin('~/.vim/plugged')

" Surround plugin: easily add, change, delete paired delimiters
Plug 'tpope/vim-surround'

" Commenting: gcc and gc mappings
Plug 'tpope/vim-commentary'

" File explorer, on-demand load
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" Status bars and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'

" Developer icons
Plug 'ryanoasis/vim-devicons'

" Fuzzy finder (requires silversearcher-ag)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Color schemes
Plug 'navarasu/onedark.nvim'
Plug 'rose-pine/neovim'
Plug 'thedenisnikulin/vim-cyberpunk'

" Git diffs in sign column
Plug 'airblade/vim-gitgutter'

" Linting and auto-fixing
Plug 'dense-analysis/ale'

" Undo history visualizer
Plug 'mbbill/undotree'

" IntelliSense engine (branch: release)
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Treesitter for better syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Language-specific syntax improvements
Plug 'vim-python/python-syntax'
Plug 'uiiaoo/java-syntax.vim'

" Closing HTML/XML tags
Plug 'alvan/vim-closetag'

call plug#end()

"──────────────────────────────────────────────────────────────────────────────
" General Settings
"──────────────────────────────────────────────────────────────────────────────
set number                      " Show absolute line numbers
set relativenumber              " Show relative line numbers
set mouse=a                     " Enable mouse in all modes
set autoindent                  " Copy indent from current line
set tabstop=4                   " Number of spaces tabs count for
set softtabstop=4               " Number of spaces for Tab in insert mode
set shiftwidth=4                " Number of spaces for autoindent
set smarttab                    " <Tab> at start of line uses shiftwidth
set encoding=UTF-8              " Use UTF-8 by default
set scrolloff=5                 " Keep 5 lines visible when scrolling
set termguicolors               " Enable true color support
set showtabline=2               " Always show tabline
set laststatus=2                " Always show statusline
colorscheme onedark             " Default colorscheme

"──────────────────────────────────────────────────────────────────────────────
" NERDTree Configuration
"──────────────────────────────────────────────────────────────────────────────
let g:NERDTreeDirArrowExpandable   = '+'
let g:NERDTreeDirArrowCollapsible   = '~'
let g:python_highlight_all          = 1

"──────────────────────────────────────────────────────────────────────────────
" Airline / Lightline Configuration
"──────────────────────────────────────────────────────────────────────────────
let g:airline_theme                 = 'onedark'
let g:airline#extensions#tabline#enabled = 1

"──────────────────────────────────────────────────────────────────────────────
" Keybindings: Pane Navigation (Alt + Arrows)
"──────────────────────────────────────────────────────────────────────────────
nnoremap <A-Left>  :wincmd h<CR>
nnoremap <A-Right> :wincmd l<CR>
nnoremap <A-Up>    :wincmd k<CR>
nnoremap <A-Down>  :wincmd j<CR>

inoremap <A-Left>  <Esc>:wincmd h<CR>
inoremap <A-Right> <Esc>:wincmd l<CR>
inoremap <A-Up>    <Esc>:wincmd k<CR>
inoremap <A-Down>  <Esc>:wincmd j<CR>

tnoremap <A-Left>  <C-\><C-n>:wincmd h<CR>
tnoremap <A-Right> <C-\><C-n>:wincmd l<CR>
tnoremap <A-Up>    <C-\><C-n>:wincmd k<CR>
tnoremap <A-Down>  <C-\><C-n>:wincmd j<CR>

"──────────────────────────────────────────────────────────────────────────────
" Keybindings: Tab Management
"──────────────────────────────────────────────────────────────────────────────
nnoremap <A-c> :tabnew<CR>
nnoremap <A-w> :tabclose<CR>
nnoremap <A-n> :tabnext<CR>
nnoremap <A-p> :tabprevious<CR>

"──────────────────────────────────────────────────────────────────────────────
" Keybindings: Copy & Paste from System Clipboard
"──────────────────────────────────────────────────────────────────────────────
vnoremap <C-c> "+y
nnoremap <C-v> "+p
inoremap <C-v> <C-r>+

"──────────────────────────────────────────────────────────────────────────────
" Keybindings: FZF Quick Access
"──────────────────────────────────────────────────────────────────────────────
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-f> :Ag<CR>
let g:fzf_layout = { 'down': '40%' }
let g:fzf_action = {
      \ 'enter': 'tab split',
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

"──────────────────────────────────────────────────────────────────────────────
" Keybindings: Pane Resizing (Ctrl+Alt+Arrows)
"──────────────────────────────────────────────────────────────────────────────
nnoremap <C-A-Right> :vertical resize +5<CR>
nnoremap <C-A-Left>  :vertical resize -5<CR>
nnoremap <C-A-Up>    :resize +5<CR>
nnoremap <C-A-Down>  :resize -5<CR>

inoremap <C-A-Right> <Esc>:vertical resize +5<CR>
inoremap <C-A-Left>  <Esc>:vertical resize -5<CR>
inoremap <C-A-Up>    <Esc>:resize +5<CR>
inoremap <C-A-Down>  <Esc>:resize -5<CR>

tnoremap <C-A-Right> <C-\><C-n>:vertical resize +5<CR>
tnoremap <C-A-Left>  <C-\><C-n>:vertical resize -5<CR>
tnoremap <C-A-Up>    <C-\><C-n>:resize +5<CR>
tnoremap <C-A-Down>  <C-\><C-n>:resize -5<CR>

"──────────────────────────────────────────────────────────────────────────────
" Neovide Opacity & Full Transparency Setup
"──────────────────────────────────────────────────────────────────────────────
if exists('g:neovide')
  " Window opacity: 0.0 (transparent) to 1.0 (opaque)
  let g:neovide_opacity = 0.6

  " Match background alpha to window opacity
  let g:neovide_background_color =
        \ '#0f1117' . printf('%02x', float2nr(255 * g:neovide_opacity))
endif

" Clear all GUI backgrounds for seamless transparency
highlight Normal      ctermbg=none guibg=none
highlight NonText     ctermbg=none guibg=none
highlight LineNr      ctermbg=none guibg=none
highlight EndOfBuffer ctermbg=none guibg=none

