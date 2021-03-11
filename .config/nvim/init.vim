call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-airline/vim-airline'
"Plug 'majutsushi/tagbar'
"Plug 'mattn/emmet-vim'
Plug 'uiiaoo/java-syntax.vim'
Plug 'sheerun/vim-polyglot'
Plug 'yuezk/vim-js'
Plug 'tpope/vim-commentary'
Plug 'junegunn/goyo.vim'
Plug 'lervag/vimtex'
Plug 'chrisbra/Colorizer'
Plug 'townk/vim-autoclose'

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
"let g:startify_custom_header = startify#pad(split(system('cbonsai -p'), '\n'))

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
imap jj <Esc>

" Tab navigation
map <C-Right> :tabnext<CR>
map <C-Left> :tabprevious<CR>

" Use ctrl-c to comment out lines
map <C-c> gcc

" Close coc.nvim suggestion with ff
"imap ff <C-o>:call coc#float#close_all()<CR>


" Visual copy and pasting
nmap <S-Up>     v<Up>
nmap <S-Down>   v<Down>
nmap <S-Left>   v<Left>
nmap <S-Right>  v<Right>
vmap <S-Up>     <Up>
vmap <S-Down>   <Down>
vmap <S-Left>   <Left>
vmap <S-Right>  <Right>
imap <S-Up>     <Esc>v<Up>
imap <S-Down>   <Esc>v<Down>
imap <S-Left>   <Esc>v<Left>
imap <S-Right>  <Esc>v<Right>

" From luke smith, auto delete all trailing whitespace on save
" autocmd BufWritePre * %s/\s\+$//e

command! Prose setlocal spell | Goyo
command! Code  colorscheme palenight | set nospell | Goyo!

source ~/.config/nvim/cocnvim.vim

