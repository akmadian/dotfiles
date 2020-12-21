call plug#begin('~/.vim/plugged')

" To Install plugins, run :PlugInstall

" Utils
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
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

set number
set list
set listchars+=eol:_
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
au BufLeave * silent! wall_ " Auto save
colorscheme afterglow
let g:afterglow_inherit_background=0
let g:afterglow_italic_comments=1

"autocmd VimEnter * NERDTree " Auto start nerdtree
"autocmd BufWinEnter * silent NERDTreeMirror " Open existing nerdtree on each new tab
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Want to take VCS inspo from base16-spacemacs
let g:airline_theme='afterglow'

function! StatuslineGit()
  let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

let g:airline_section_b='\uE0A0 %{StatuslineGit()}'

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


" To get out of terminal mode with esc
tnoremap <Esc> <C-\><C-n>

cnoreabbrev save w
cnoreabbrev saveall wa
cnoreabbrev quit q
cnoreabbrev renametab file
cnoreabbrev reloadvimrc source ~/.nvimrc
cnoreabbrev closeall qa

" PLUGIN CONFIG
" coc.nvim
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
inoremap <expr> <c-space> coc#refresh()
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : '\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>'

inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() : '\<C-g>u\<TAB>'

