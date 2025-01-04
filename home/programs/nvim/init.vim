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

" update everything, faster completion
set updatetime=300

" auto signcolumn
set signcolumn=auto

" set terminal title to vim
set title
set titlestring=%(%{expand(\"%:~:h\")}%)#%(\ %t%)%(\ %M%)%(\ %)NVIM

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" File browser
let g:netrw_banner=0
let g:netrw_liststyle=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_keepdir=0
let g:netrw_localcopydircmd='cp -r'

" Defualt Clipboard
set clipboard+=unnamedplus

" true colors, needs patched urxvt or st to work right
set termguicolors

" set mouse on
set mouse=a

" https://stackoverflow.com/questions/34675677/disable-highlight-matched-parentheses-in-vim-let-loaded-matchparen-1-not-w
let loaded_matchparen = 1
set noshowmatch

inoremap {<CR? {<CR>}<C-o>O}
set splitright
set splitbelow

" auto file wrap for certain types of files

" save file w/ ctrl+s
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <c-s> <Esc>:Update<CR>

" set relativenumber
set nu

" cursor blinkage
" set guicursor=v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait1700-blinkoff400-blinkon950-Cursor/lCursor,sm:block,n:block-blinkon0

set smarttab
set cindent
set tabstop=2
set softtabstop=2
set shiftwidth=2

" always uses spaces instead of tab characters
set expandtab

" keep undos in a file
set undofile
set undodir=~/.local/share/nvim/cache

" lines to keep cursor vertically centered
set scrolloff=10

" remember cursor location
set viminfo='100,\"2500,:200,%,n~/.cache/.viminfo

" set encodings
set fileencodings=utf-8
set encoding=utf-8

" Map Ctrl-Backspace to delete the previous word in insert mode.
imap <C-BS> <C-W>
imap <C-H> <C-W>

augroup WrapLineInTexFile
  autocmd!
  autocmd FileType md setlocal wrap
augroup END

" term toggle 
map <C-t> :term<CR>A

" exit terminal mode mapping
tnoremap <Esc> <C-\><C-n>

" nnoremap <silent> <C-q> <C-w>s<C-w>j:resize 20<CR>:terminal<CR><S-i>

" coq leader
let mapleader = ","

" Focus commands
nnoremap <C-a>z :Goyo 80<CR>
nnoremap <C-a>q :Goyo!<CR>

" mapping control h,l to move forward and backward an entire word
" nnoremap <C-h> b
" nnoremap <C-l> w

xnoremap <C-h> b
xnoremap <C-l> w
