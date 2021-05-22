call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'townk/vim-autoclose'
Plug 'alvan/vim-closetag', { 'for': ['html', 'jsx', 'js', 'vue'] }
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'chrisbra/Colorizer', { 'on': 'ColorHighlight' }

" Plug 'kshenoy/vim-signature'
" Plug 'tpope/vim-eunuch'
" Plug 'andrewradev/splitjoin.vim'

" Syntax Highlighting/ Lang Support
" Plug 'sheerun/vim-polyglot'
" Only load language support packs when needed to cut startup time
" Plug 'uiiaoo/java-syntax.vim', { 'for': 'java' }
" Plug 'yuezk/vim-js', { 'for': 'javascript' }
" Plug 'lervag/vimtex', { 'for': 'tex' }

" Color Schemes
Plug 'drewtempelmeyer/palenight.vim'
" Plug 'KeitaNakamura/neodark.vim'
" Plug 'embark-theme/vim', { 'as': 'embark' }
" Plug 'aereal/vim-colors-japanesque'
call plug#end()

filetype plugin indent on
syntax on

if (has("termguicolors"))
  set termguicolors
endif

set nocompatible
set number relativenumber
set hidden
set smartcase
set list
set listchars=tab:<->,nbsp:+,eol:·
set tabstop=2 expandtab shiftwidth=2 softtabstop=2
set splitbelow splitright
highlight link JavaIdentifier NONE

" autosave on bufleave
autocmd BufLeave * silent! wall

" Highlight trailing whitespace in red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" COLOR SCHEMES
" let g:neodark#background = '#202020'
" let g:neodark#background = '#251621'
" colorscheme neodark

colorscheme palenight

let g:vimtex_view_method = 'zathura'
let g:vimtex_toc_config = {
  \'split_pos' : ':vert :botright',
  \'split_width': 50,
  \}

" Due to some glyph rendering issues, I just rewrote this.
let g:airline_section_z = '%p%% ☰ %l/%L ln : %v (%b)'
" https://shapeshed.com/vim-statuslines/ - For custom status line project

" Testing indenting and deindenting without moving cursor
inoremap <tab> <C-t>
inoremap <S-tab> <C-d>

" (D)elete (t)o (l)ine (a)bove. Ex:
"    key: val,    -->  key: val, key2: val2
"    key2: val2
" Works anywhere on the bottom line
nmap dtla kJ

" Get out of terminal mode easier
tnoremap <Esc> <C-\><C-n>

" Split navigation shortcutting
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Remap esc
imap jk <Esc>
imap kj <Esc>

" Tab navigation
map <S-Right> :tabnext<CR>
map <S-Left> :tabprevious<CR>

" Use ctrl-c to comment out lines
map <C-c> gcc

" Replace all
nnoremap Ra :%s//g<Left><Left>

" Clean up tex build files whenever a .tex file is closed - From Luke Smith's dotfiles
autocmd VimLeave *.tex !texclear %
nmap tc VimtexTocOpen

" Save file as sudo on files that require root
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Commands for prose and code mode
command! Prose setlocal spell | Goyo
command! Code  colorscheme palenight | set nospell | Goyo!

source ~/.config/nvim/cocnvim.vim

