set nocompatible

" Vundle settings
filetype off
" Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jeaye/color_coded'
Plugin 'rdnetto/YCM-Generator'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rhysd/vim-clang-format'
call vundle#end()
filetype plugin indent on

" vim-airline settings
" Show buffers at the top if no tabs are open.
let g:airline#extensions#tabline#enabled=1

" YouCompleteMe settings
" Prevent YouCompleteMe from showing a warning every time it loads
" .ycm_extra_conf.py.
let g:ycm_confirm_extra_conf=0
map <C-j> :YcmCompleter GoToDeclaration<CR>

" vim-cpp-enhanced-highlight settings
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1

" vim-clang-format settings
let g:clang_format#code_style="google"
let g:clang_format#style_options = {
  \ "AllowShortIfStatementsOnASingleLine" : "true",
  \ "Standard" : "C++11" }
autocmd FileType c,cpp,objc nnoremap <C-k> :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <C-k> :ClangFormat<CR>

" netrw settings (vim default file browser)
" Default to tree-view.
let g:netrw_liststyle=3
" Hide banner by default (press "I" to toggle it).
let g:netrw_banner=0

" Tell vim where to look for tags file. It'll look in the current directory,
" then the parent directory, and up until it hits HOME (that's what the
" semicolon means).
set tags=./tags,tags;$HOME

" Enables yanking into the system clipboard, so you can "yy" to yank the
" current line, and then paste it to another application.
set clipboard=unnamedplus

" Enable syntax highlighting.
syntax on

" This is the default theme used for "dark" terminals.
colorscheme ron

" Show line numbers.
set number

" Show the current row and column at the bottom.
set ruler

" Show a ruler to the right of 100 chars.
set colorcolumn=100

" Size of a hard tabstop.
set tabstop=2

" Size of an "indent".
set shiftwidth=2

" A combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop.
set softtabstop=2

" Make "tab" insert indents instead of tabs at the beginning of a line.
set smarttab

" Always uses spaces instead of tab characters.
set expandtab

" Highlight any trailing whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Always show the statusline.
set laststatus=2

" Prevent the text from being wrapped automatically.
set textwidth=0
set wrapmargin=0

" Allow backspacing over autoindent, line breaks, and the start of insert.
set backspace=indent,eol,start

" Allow switching buffers without saving the current buffer first.
set hidden

" Map ctrl-h to move to the previous buffer ":bp", and ctrl-l to move to the
" next buffer "bn".
map <C-h> :bp<CR>
map <C-l> :bn<CR>
