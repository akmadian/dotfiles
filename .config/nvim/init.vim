call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'KeitaNakamura/neodark.vim'
call plug#end()

colorscheme neodark

filetype plugin on
syntax on
set termguicolors
set number relativenumber
set list
set listchars=eol:·
set tabstop=2 expandtab shiftwidth=2 softtabstop=2
set splitbelow splitright

autocmd BufLeave * silent! wall

" If there is no open terminal buffer, open one
if bufwinnr("term") > 0
  tabe
  term
  file term
  tabp
endif

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
autocmd BufWritePre * %s/\s\+$//e

" Auto Pairs
" Map <CR> to insert a new indented line if cursor in pairs



source ~/dotfiles/cocnvim.vim
