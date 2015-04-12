set nocompatible               " be iMproved

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

silent! runtime bundles.vim

"  ---------------------------------------------------------------------------
"  General
"  ---------------------------------------------------------------------------
set number
syntax enable


" Files and backups
set nobackup
set nowb
set noswapfile

" Tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
 
" Linebreak on 500 characters
set lbr
set tw=500

set pastetoggle=<F2>
set wrap "Wrap lines
 
" ui
set cmdheight=2
set smartcase
set hlsearch
set lazyredraw
set magic
set showmatch
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set number
 
" Nerdtree
" autocmd vimenter * NERDTree
 
" Fuzzy Finder
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
 
" Splitting
noremap <C-W>v :Vsplit
noremap <C-W>s :split
" nmap <silent> <A-Left> :wincmd h<CR>
" nmap <silent> <A-Right> :wincmd l<CR>
 
" Airline
"let g:airline_theme='solarized'
set laststatus=2

" Ctrl-P ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.meta

" Syntastic
