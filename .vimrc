set nocompatible

" Vundle
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'AutoComplPop'
call vundle#end()
filetype plugin indent on

" Tell vim where to look for tags file. It'll look in the current directory, then the parent
" directory, and up until it hits HOME (that's what the semicolon means).
set tags=./tags,tags;$HOME

" Enable syntax highlighting
syntax on

" Show the current row and column at the bottom
set ruler

" Show a ruler to the right of 100 chars
set colorcolumn=100

" Size of a hard tabstop
set tabstop=2

" Size of an "indent"
set shiftwidth=2

" A combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=2

" Make "tab" insert indents instead of tabs at the beginning of a line
set smarttab

" Always uses spaces instead of tab characters
set expandtab
