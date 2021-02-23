call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'uiiaoo/java-syntax.vim'
Plug 'sheerun/vim-polyglot'
Plug 'yuezk/vim-js'
Plug 'tpope/vim-commentary'
Plug 'bronson/vim-trailing-whitespace'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'

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
set listchars=eol:·
set tabstop=2 expandtab shiftwidth=2 softtabstop=2
set splitbelow splitright
highlight link JavaIdentifier NONE

autocmd BufLeave * silent! wall

"let g:neodark#background = '#202020'
"let g:oceanic_for_polyglot=1
colorscheme palenight

" Due to some glyph rendering issues, I just rewrote this.
let g:airline_section_z = '%p%% ☰ %l/%L ln : %v (%b)'

let g:startify_change_to_vcs_root = 1
"let g:startify_custom_header = startify#pad(split(system('cbonsai -p'), '\n'))

" Get out of terminal mode easier
tnoremap <Esc> <C-\><C-n>

" Tab navigation
map <C-Right> :tabnext<CR>
map <C-Left> :tabprevious<CR>

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

source ~/.config/nvim/cocnvim.vim

