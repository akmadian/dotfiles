call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'airblade/vim-gitgutter'
  Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } " Only load Goyo on Goyo command
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'chrisbra/Colorizer', { 'on': 'ColorHighlight' }

  " Syntax Highlighting/ Lang Support
  Plug 'sheerun/vim-polyglot'

  " Only load language support packs when needed to cut startup time
  Plug 'uiiaoo/java-syntax.vim', { 'for': 'java' }
  Plug 'yuezk/vim-js', { 'for': 'javascript' }
  Plug 'lervag/vimtex', { 'for': 'tex' }
  Plug 'alvan/vim-closetag', { 'for': ['html', 'jsx', 'js', 'vue'] } " Only load on langs that use markup

  " Plug 'aereal/vim-colors-japanesque'
  Plug 'wojciechkepka/bogster'
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
set listchars=tab:<->,nbsp:+
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

colorscheme bogster

let g:vimtex_view_method = 'zathura'
let g:vimtex_toc_config = {
  \'split_pos' : ':vert :botright',
  \'split_width': 50,
  \}

" https://shapeshed.com/vim-statuslines/ - For custom status line project
let g:currentmode={
       \ 'n'  : 'NORMAL ',
       \ 'v'  : 'VISUAL ',
       \ 'V'  : 'V·Line ',
       \ "\<C-V>" : 'V·Block ',
       \ 'i'  : 'INSERT ',
       \ 'R'  : 'R ',
       \ 'Rv' : 'V·Replace ',
       \ 'c'  : 'Command ',
       \}

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('[+%d ~%d -%d]', a, m, r)
endfunction

set statusline=
set statusline+=%#BogsterRedBold#\ %{toupper(g:currentmode[mode()])} " Mode
set statusline+=%#BogsterBase4#
set statusline+=\ %F
set statusline+=\ %{GitStatus()}\ [buffer\ number\ %n]\ %y
set statusline+=%= " Right Align
set statusline+=\ ☰\ line\ %l\ of\ %L,\ (%p%%)\ col\ %v
set statusline+=\  " Padding

" Testing indenting and deindenting without moving cursor
inoremap <tab> <C-t>
inoremap <S-tab> <C-d>

" Get out of terminal mode easier
tnoremap <Esc> <C-\><C-n>

nmap ss :source %<CR>

" Make working with buffers easier
nmap nb :bnext <CR>
nmap nn :bnext <CR>


" Split navigation shortcutting
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" Use ctrl-c to comment out lines
map <C-c> gcc<Esc>

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

