syntax on

" Wrap gitcommit file types at the appropriate length
filetype indent plugin on

set clipboard=unnamed

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"if !empty(glob("~/.vim/plugged"))
call plug#begin('~/.vim/plugged')
" Plug 'nightsense/office'
  Plug 'nightsense/vimspectr'
  Plug 'vim-airline/vim-airline'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-fugitive'           " Git
  Plug 'tpope/vim-rails'              " Ruby on rails editing
  Plug 'tpope/vim-surround'           " surrounding text
  Plug 'w0rp/ale'                     " async lint engine
  Plug 'airblade/vim-gitgutter'       " show +/-/~ in gutter
  Plug 'https://github.com/terryma/vim-multiple-cursors.git' 
 "Plug 'mileszs/ack.vim'
 " Plug 'ervandew/ag'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
call plug#end()
"end

":silent! colorscheme office-dark
:silent! colorscheme vimspectr210-dark

set number
set expandtab
let g:airline#extensions#ale#enabled = 1
set tabstop=2
let g:ctrlp_open_new_file = 'r'
se mouse+=a

set wildmenu
set wildmode=longest:full,full

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" " Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

"No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500



" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3

filetype plugin indent on
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab
set backupdir=~/.vimswp
