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
 Plug 'nightsense/office'
 Plug 'vim-airline/vim-airline'
 Plug 'ctrlpvim/ctrlp.vim'
 Plug 'tpope/vim-fugitive'           " Git
 Plug 'tpope/vim-rails'              " Ruby on rails editing
 Plug 'tpope/vim-surround'           " surrounding text
 Plug 'w0rp/ale'                     " async lint engine
 Plug 'airblade/vim-gitgutter'       " show +/-/~ in gutter
 Plug 'https://github.com/terryma/vim-multiple-cursors.git' 
call plug#end()
"end

:silent! colorscheme office-dark

set number
set expandtab
let g:airline#extensions#ale#enabled = 1
set tabstop=2
let g:ctrlp_open_new_file = 'r'

filetype plugin indent on
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab
set backupdir=~/.vimswp
