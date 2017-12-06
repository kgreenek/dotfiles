set nocompatible

" Vundle settings
filetype off
" Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rhysd/vim-clang-format'
Plugin 'tell-k/vim-autopep8'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-syntastic/syntastic'
call vundle#end()
filetype plugin indent on

" Nerdtree settings
map <C-n> :NERDTreeToggle<CR>

" vim-airline settings
" Show buffers at the top if no tabs are open.
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1

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
  \ "DerivePointerAlignment" : "false",
  \ "PointerAlignment" : "Right",
  \ "Standard" : "C++11",
  \ "ColumnLimit" : "100" }
autocmd FileType c,cpp,objc nnoremap <C-k> :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <C-k> :ClangFormat<CR>

" rust settings
autocmd FileType rust nnoremap <C-k> :<C-u>RustFmt<CR>
" NOTE: RustFmtRange seems to be broken right now, so this doesn't work.
" See: https://github.com/rust-lang/rust.vim/issues/156
autocmd FileType rust vnoremap <C-k> :'<,'>RustFmtRange<CR>

" Autopep8 settings
let g:autopep8_disable_show_diff=1
let g:autopep8_max_line_length=100
autocmd FileType python nnoremap <C-k> :<C-u>Autopep8<CR>
autocmd FileType python vnoremap <C-k> :'<,'>Autopep8<CR>

" Syntastic settings
" NOTE: Do not set syntastic statusline flags because airline picks up
" syntastic automatically and manages the statusline.
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--max-line-length=100'

let g:syntastic_rust_checkers=["cargo"]

" Use grip with vim-markdown-preview
let vim_markdown_preview_github=1

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

" Press jj to exit edit mode to prevent having to stretch to esc.
imap jj <Esc>
