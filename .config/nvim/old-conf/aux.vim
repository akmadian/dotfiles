" This file contains stuff that I want to keep around, but don't want in my
" init.vim.

" Plugins
Plug 'hattya/vcs-info.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }
Plug 'chrisbra/csv.vim'

" Color Schemes
Plug 'sainnhe/sonokai'
Plug 'KeitaNakamura/neodark.vim'
Plug 'adrian5/oceanic-next-vim'
Plug 'artanikin/vim-synthwave84'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'mbbill/vim-seattle'
Plug 'tyrannicaltoucan/vim-quantum'

" Experimental git vcs info for airline
let vcs = vcs_info#get()
if !empty(vcs)
  let g:airline_section_b+=vcs.head
endif


