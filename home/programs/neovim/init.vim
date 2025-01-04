set nocompatible
filetype on
filetype plugin on
filetype indent on

" syntax on
syntax on

" num highlighting on
set number

" tab stuff
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

set nobackup
set scrolloff=10
set incsearch
set ignorecase
set filetype=on
set smartcase
set nowrap
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.png
set noswapfile
set wildmode=longest,list
set cc=80
set colorcolumn=0
set t_Co=256
let s:fontsize = 12

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
