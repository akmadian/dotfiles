call plug#begin('~/.vim/plugged')
" Utils
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'niklaas/lightline-gitdiff'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'mcchrish/nnn.vim'
Plug 'vimwiki/vimwiki'

Plug 'mhinz/vim-startify' " Start screen
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/sudo.vim'

" Other favorite themes include
" ayu-theme/ayu-vim, nanotech/jellybeans.vim, chriskempson/base16-vim
" zeis/vim-kolor
Plug  'danilo-augusto/vim-afterglow'

" Langs
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'} " R
call plug#end()

set nocompatible
filetype plugin on
syntax on

set number
set list
set listchars=eol:·
set tabstop=4 expandtab shiftwidth=4 softtabstop=4

colorscheme afterglow
autocmd TextChanged,TextChangedI,BufLeave * silent! wall
let g:afterglow_inherit_background=0
let g:afterglow_italic_comments=1

let g:vimwiki_list = [{'path': '~/dotfiles/vimwiki/'}]

let g:indentLine_char = '┆'

" Want to take VCS inspo from base16-spacemacs
let g:airline_theme='afterglow'

function! StatuslineGit()
    let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    return strlen(l:branchname) > 0 ? l:branchname : ''
endfunction

let g:lightline#gitdiff#indicator_added='+'
let g:lightline#gitdiff#indicator_deleted='-'
let g:lightline#gitdiff#indicator_modified='~'
let g:lightline#gitdiff#show_empty_indicators=1
let g:airline#extensions#tagbar#enabled=1
let g:airline_section_b='%{StatuslineGit()} ⎇ %{lightline#gitdiff#get()}'
let g:airline_section_c='%{expand("%t")}'

nnoremap <leader>n :NnnPicker %:p:h<CR>
let g:nnn#action = {
    \ '<c-t>': 'tab split'}
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#command = 'nnn -d -e -H -S'

"Tab navigation
map <C-Left> :tabprevious<CR>
map <C-Right> :tabnext<CR>

"Shift + Arrow Text Selection
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

" Copy/ Paste
vmap <C-c>      y<Esc>i
vmap <C-x>      d<Esc>i
map  <C-v>       pi
imap <C-v>      <Esc>pi
imap <C-z>      <Esc>ui

" PLUGIN CONFIG
" coc.nvim
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
