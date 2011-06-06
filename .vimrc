"
"
"
"
"
"

set nocompatible        " Use vim defaults
set termencoding=utf-8  " character encoding
set enc=utf-8
set fenc=utf-8
set history=50          " Conserve 50 lignes d'historique des commandes
set bs=2                " Authorize all deletion
set history=200         " Save the last 200 commands in history
set undolevels=100      " Save the last 200 undos in history
set ruler               " Always show the cursor
set shiftwidth=4        " Number of characters per indentation
set tabstop=4           " Number of spaces per tabulation
set softtabstop=4       " Number of spaces per backspace
set expandtab           " Convert tabs into spaces
"set nu                  " Display the number of each line
set showcmd             " Display incomplete commands
set title               " Name of the file in the window tab's title
set noerrorbells        " Shut the bell

set backup " Keep a backup file
if !filewritable($HOME."/.vim/backup")
    call mkdir($HOME."/.vim/backup", "p") " Creation of the backup dir
endif
set backupdir=$HOME/.vim/backup " directory for ~ files
set directory=.,./.backup,/tmp

if &t_Co> 2 || has("gui_running")
    " When terminal has colors, active syntax coloration
    syntax on
    set hlsearch " Highlight results
    " TIP: Type 'nohl' to remove highlight
    set incsearch " Highlight of the first matching string
    set smartcase " Highlight first matching string using history
endif

if has("autocmd")
    filetype on
    filetype plugin indent on
    filetype plugin on
    autocmd BufRead *.txt set tw=78
    au BufRead,BufNewFile *.txt set filetype=doctest " coloration with doctest.vim
else
    set autoindent " always set autoindenting on
endif

" Show hidden characters like tab or endl
set list
set lcs:tab:>-,trail:.

" List classes and methods in the opened files
map <F8> :TlistToggle<cr>
let Tlist_GainFocus_On_ToggleOpen=0
let Tlist_Exit_OnlyWindow=1

" paste toggle for autoindent pb
set pastetoggle=<F2>

" better statusline
" left side
set statusline=%#User1#%F\ %#User2#%m%r%h%w\ %<%{&ff}%-15.y
set statusline+=\ [ascii:\%03.3b/hexa:\%02.2B]
" right side
set statusline+=\ %=\ %0.((%l,%v%))%5.p%%/%L
set statusline+=\ %=\ %{SetTimeOfDayColors()}\ %0.((%l,%v%))%5.p%%/%L
set laststatus=2
if version >= 700
    " Filename
    highlight User1 cterm=bold ctermfg=4 ctermbg=Black
    highlight User2 term=bold,underline cterm=bold,underline gui=bold,underline
    " Search
    highlight Search term=standout ctermfg=4 ctermbg=7
    " SplitLine
    highlight VertSplit ctermbg=red ctermfg=Black guibg=red
    au VimEnter * hi StatusLine term=bold ctermfg=DarkRed ctermbg=7 gui=bold
    " statusline color change when in insert mode
    au InsertEnter * hi StatusLine term=underline ctermbg=3 gui=underline
    au InsertLeave * hi StatusLine term=bold ctermfg=DarkRed ctermbg=7 gui=bold
    " Cursor
    highlight CursorLine ctermbg=233 cterm=bold
    highlight CursorColumn ctermbg=233 cterm=bold
endif

" .vimrc autoreload
autocmd BufWritePost .vimrc source %

" Section: Functions
" ==================

" Function: LastModified
" If buffer modified, update any 'Last modified: ' in the first 20 lines.
" 'Last modified: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
function! LastModified()
  if &modified
    let save_cursor = getpos(".")
    let n = min([20, line("$")])
    exe '1,' . n . 's#^\(.\{,10}Last Modified: \).*#\1' .
          \ strftime('%a %b %d, %Y  %I:%M%p') . '#e'
    call setpos('.', save_cursor)
  endif
endfun
autocmd BufWritePre * call LastModified()

" Function: SetTimeOfDayColors
" Function to change the colorscheme depending on the hour of the day
let g:colors_name="xyzzy"
let g:Favcolorschemes = ["darkblue", "molokai", "candycode", "anotherdark"]
function! SetTimeOfDayColors()
    " currentHour will be 0, 1, 2, or 3
    let g:CurrentHour = (strftime("%H") + 0) / 6
    if g:colors_name !~ g:Favcolorschemes[g:CurrentHour]
        execute "colorscheme " . g:Favcolorschemes[g:CurrentHour] 
        redraw
    endif
endfunction
call SetTimeOfDayColors()

" Section: Python
" ===============
source ~/.vim/vimrc/vimrc_python.vim

