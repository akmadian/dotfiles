call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'townk/vim-autoclose'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"Plug 'chrisbra/Colorizer'

" Syntax Highlighting/ Lang Support
Plug 'uiiaoo/java-syntax.vim'
Plug 'sheerun/vim-polyglot'
Plug 'yuezk/vim-js'
Plug 'lervag/vimtex'

" Color Schemes
Plug 'drewtempelmeyer/palenight.vim'
call plug#end()

filetype plugin indent on
syntax on

if (has("termguicolors"))
  set termguicolors
endif

set nocompatible
set number relativenumber
set hidden
set list
set listchars=tab:<->,nbsp:+,eol:·
set tabstop=2 expandtab shiftwidth=2 softtabstop=2
set splitbelow splitright
highlight link JavaIdentifier NONE

autocmd BufLeave * silent! wall
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

"let g:neodark#background = '#202020'
"let g:oceanic_for_polyglot=1
colorscheme palenight

" Due to some glyph rendering issues, I just rewrote this.
let g:airline_section_z = '%p%% ☰ %l/%L ln : %v (%b)'
let g:startify_change_to_vcs_root = 1
let g:vimtex_view_method = 'zathura'
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
nnoremap S :%s//g<Left><Left>

" Clean up tex build files whenever a .tex file is closed - From Luke Smith's dotfiles
autocmd VimLeave *.tex !texclear %

" Save file as sudo on files that require root
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

command! Prose setlocal spell | Goyo
command! Code  colorscheme palenight | set nospell | Goyo!

source ~/.config/nvim/cocnvim.vim

