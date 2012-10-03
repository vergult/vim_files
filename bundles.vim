set nocompatible               " be iMproved

if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif

filetype off                   " must be off before Vundle has run

set runtimepath+=~/.vim/bundle/vundle/

call vundle#rc()

Bundle 'gmarik/vundle'
Bundle "mileszs/ack.vim"
Bundle "tpope/vim-rvm"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-surround"
Bundle "chrismetcalf/vim-yankring"
Bundle "chrismetcalf/vim-taglist"
Bundle "tpope/vim-endwise"
Bundle "scrooloose/syntastic"
Bundle "Townk/vim-autoclose"
Bundle "scrooloose/nerdtree"
Bundle 'tomtom/tcomment_vim'
Bundle "sjl/gundo.vim"
Bundle "godlygeek/tabular"
Bundle "vim-scripts/Gist.vim"
Bundle "vim-scripts/L9"
Bundle "kien/ctrlp.vim"

" Snipmate Dependencies
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "snipmate-snippets"
" Snipmate
Bundle "garbas/vim-snipmate"

" Color schemes
Bundle 'tomasr/molokai'

Bundle 'Lokaltog/vim-powerline'
Bundle "kana/vim-textobj-user"
Bundle "nelstrom/vim-textobj-rubyblock"
Bundle "ervandew/supertab"

" Languages
Bundle 'vim-ruby/vim-ruby'
Bundle "pangloss/vim-javascript"
Bundle 'vim-scripts/jQuery'
Bundle 'briancollins/vim-jst'
Bundle "cakebaker/scss-syntax.vim"
Bundle "tpope/vim-markdown"
Bundle "greyblake/vim-preview"
Bundle "mattn/zencoding-vim"
Bundle "digitaltoad/vim-jade"
Bundle "mmalecki/vim-node.js"

filetype plugin indent on     " and turn it back on!

runtime macros/matchit.vim
