" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


" Color schemes
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ColorSchemeMenuMaker'
Plugin 'rainux/vim-desert-warm-256'

" Files
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

" Utility
Plugin 'tpope/vim-surround'
Plugin 'Townk/vim-autoclose'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/ZoomWin'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'

" Plugin "Valloric/YouCompleteMe"
Plugin 'gmarik/snipmate.vim'
Plugin 'airblade/vim-rooter'
"Plugin 'vim-scripts/YankRing.vim'
Plugin 'nathanaelkane/vim-indent-guides'

if executable('ag')
  Plugin 'epmatsw/ag.vim.git'
elseif executable('ack')
  Plugin 'mileszs/ack.vim'
endif

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter.git'

" Tmux
Plugin 'benmills/vimux'
Plugin 'jgdavey/vim-turbux'

" Syntax lint
Plugin 'scrooloose/syntastic'

call vundle#end()            " required
filetype plugin indent on    " required
