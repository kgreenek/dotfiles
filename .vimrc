set nocompatible

" Vundle
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
call vundle#end()
filetype plugin indent on

" vim-airline settings
" Show buffers at the top if no tabs are open
let g:airline#extensions#tabline#enabled = 1

" Tell vim where to look for tags file. It'll look in the current directory, then the parent
" directory, and up until it hits HOME (that's what the semicolon means).
set tags=./tags,tags;$HOME

" Enable syntax highlighting
syntax on

" Show line numbers
set number

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

" Highlight any trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Always show the statusline
set laststatus=2

" Prevent the text from being wrapped automatically.
set textwidth=0
set wrapmargin=0

" Allow backspacing over autoindent, line breaks, and the start of insert
set backspace=indent,eol,start

" Map ctrl-h to move to the previous buffer ":bp", and ctrl-l to move to the next buffer ":bn"
map <C-h> :w<CR>:bp<CR>
map <C-l> :w<CR>:bn<CR>
