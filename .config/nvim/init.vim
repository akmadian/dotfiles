call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  "Plug 'preservim/nerdcommenter'
  "Plug 'scrooloose/syntastic'
  "Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }

  Plug 'ayu-theme/ayu-vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'dense-analysis/ale'
  Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
call plug#end()

filetype plugin on
syntax on
set mouse=a
set nocompatible
set smartindent smartcase smarttab expandtab

autocmd BufNewFile,BufRead *.text,*.txt :set filetype=text
autocmd BufNewFile,BufRead *.md :set filetype=markdown

" Highlight trailing whitespace in red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set termguicolors
let ayucolor="mirage"
colorscheme ayu

nmap ww :w<CR>
nmap ss :so %<CR>
nmap <silent> bs :buffers<CR>
nmap <silent> bn :bnext<CR>
nmap <silent> bp :bprev<CR>
nmap <silent> bc :bd!<CR>

nnoremap <A-f> :NERDTreeFocus<CR>
nnoremap <A-t> :NERDTreeToggle<CR>
nnoremap <A-d> :ALEGoToDefinition<CR>

set statusline=
set statusline+=\ %n
set statusline+=\ %t\ %M\ %R

set statusline+=%= " Right Align
set statusline+=%y\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ line\ %l\ of\ %L,\ (%p%%)\ col\ %v\ " Extra space at end for padding

let g:ale_floating_preview = 1
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace']
\}
let g:ale_fix_on_save = 1
