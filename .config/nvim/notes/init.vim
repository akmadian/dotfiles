call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } " Only load Goyo on Goyo command
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}

  Plug 'ayu-theme/ayu-vim'
call plug#end()

filetype plugin indent on
syntax on

set nocompatible
"set number
set smartcase " Case insensitive unless caps used in search
set incsearch " Start searching when typing starts instead of waiting for enter
set tabstop=2 expandtab shiftwidth=2 softtabstop=2
set scrolloff=5 " Always show 5 rows from edge of screen

set spell spelllang=en_us

au BufRead,BufNewFile *.txt set ft=text syntax=text
au BufRead,BufNewFile *.md set ft=markdown syntax=markdown

set termguicolors
let ayucolor="mirage"
colorscheme ayu

nmap ww :w<CR>
nmap ss :so %<CR>
"nmap <A-s> :Rg<CR>

"source ~/.config/nvim/newnotes/fzf.vim
