filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"=============== General ================
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'bling/vim-bufferline'
Plugin 'skwp/greplace.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'ervandew/supertab'

"================ PHP ====================
Plugin 'StanAngeloff/php.vim'
" Inserting 'use' statements automatically
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'tobyS/pdv'

"================ Misc ==================
"Syntac checking for lots of languages
Bundle "scrooloose/syntastic"
Plugin 'tobyS/vmustache'
Plugin 'SirVer/ultisnips'

"===============TODO===============
"
"
"
"===============TODO===============


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
