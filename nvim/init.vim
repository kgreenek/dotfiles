set nocompatible

" Auto-install plug and plugins if it doesn't exist already.
" See: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob("${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"))
  silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim" --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

function! BuildFZF(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status != 'unchanged' || a:info.force
    !./install --key-bindings --completion --no-update-rc
  endif
endfunction

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status != 'unchanged' || a:info.force
    !./install.py --ninja --clangd-completer --rust-completer
  endif
endfunction

call plug#begin(stdpath('data')."/plugged")
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'airblade/vim-gitgutter'
Plug 'bazelbuild/vim-ft-bzl'
Plug 'bfrg/vim-cpp-modern'
Plug 'bling/vim-airline'
Plug 'cstrahan/vim-capnp'
Plug 'drmikehenry/vim-headerguard'
Plug 'francoiscabrol/ranger.vim'  " Depends: bclose.vim
Plug 'google/vim-codefmt'  " Depends: vim-maktaba
Plug 'google/vim-glaive'
Plug 'google/vim-maktaba'
Plug 'grailbio/bazel-compilation-database'  " Conflicts: vim-ros-ycm
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': function('BuildFZF') }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'rbgrouleff/bclose.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'tpope/vim-fugitive'
Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
call plug#end()

" Enable syntax highlighting.
let python_highlight_all=1
syntax on
filetype plugin indent on

" vim-codefmt settings
if exists("glaive#Install")
  call glaive#Install()
endif

" Bind ctrl-k to format the file, depending on the filetype of the current buffer.
augroup codefmt_bindings
  " NOTE: Range formatting is not supported for buildifier.
  autocmd FileType bzl nnoremap <buffer> <C-k> :FormatCode buildifier<CR>
  autocmd FileType bzl vnoremap <buffer> <C-k> :FormatLines buildifier<CR>

  autocmd FileType c,cpp,objc,proto,javascript,arduino nnoremap <buffer> <C-k> :FormatCode clang-format<CR>
  autocmd FileType c,cpp,objc,proto,javascript,arduino vnoremap <buffer> <C-k> :FormatLines clang-format<CR>

  autocmd FileType python nnoremap <buffer> <C-k> :FormatCode yapf<CR>
  autocmd FileType python vnoremap <buffer> <C-k> :FormatLines yapf<CR>

  autocmd FileType rust nnoremap <buffer> <C-k> :FormatCode rustfmt<CR>
  autocmd FileType rust vnoremap <buffer> <C-k> :FormatLines rustfmt<CR>
augroup END

" headerguard settings
function! g:HeaderguardName()
  let relpath = substitute(expand("%:p"), getcwd() . "/" , "", "")
  return toupper(substitute(relpath, "[^0-9a-zA-Z_]", "_", "g")) . "_"
endfunction
function! g:HeaderguardLine3()
  return "#endif  // " . g:HeaderguardName()
endfunction
map <C-g> :HeaderguardAdd<CR>

" Ranger settings
" open ranger when vim open a directory
let g:ranger_replace_netrw=1
" Disable the default leader-f keybinding and use ours instead.
let g:ranger_map_keys=0
map <C-n> :Ranger<CR>

" vim-airline settings
" Show buffers at the top if no tabs are open.
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
"let g:airline_left_sep="\uE0D2"
"let g:airline_right_sep="\uE0D4"
let g:airline_left_sep=" "
let g:airline_right_sep=" "

" YouCompleteMe settings
map <C-j> :YcmCompleter GoToImprecise<CR>
" Prevent YouCompleteMe from showing a warning every time it loads
" .ycm_extra_conf.py.
let g:ycm_confirm_extra_conf=0
let g:ycm_autoclose_preview_window_after_completion=1

" Recommended settings from: https://clang.llvm.org/extra/clangd/Installation.html
" Let clangd fully control code completion.
"let g:ycm_clangd_uses_ycmd_caching=0

" startify settings
" Automatically save loaded session on exit.
let g:startify_session_persistence=1
let g:startify_lists = [
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'files',     'header': ['   MRU']            },
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]

" Use grip with vim-markdown-preview
let vim_markdown_preview_github=1

set showmatch               " show matching brackets.
set wildmode=longest,list   " get bash-like tab completions

" Create directories if they don't exist.
if !isdirectory(stdpath('data')."/bak")
  call mkdir(stdpath('data')."/bak", "p")
endif
if !isdirectory(stdpath('data')."/swp")
  call mkdir(stdpath('data')."/swp", "p")
endif
if !isdirectory(stdpath('data')."/undo")
  call mkdir(stdpath('data')."/undo", "p")
endif
" Save swp, undo, and backup files in a central location instead of the cwd.
" For Unix and Win32, if a directory ends in two path separators "//" or "\\",
" the swap file name will be built from the complete path to the file with all
" path separators substituted to percent '%' signs. This will ensure file name
" uniqueness in the preserve directory.
let backupdir=stdpath('data')."/bak//"
let directory=stdpath('data')."/swp//"
let undodir=stdpath('data')."/undo//"

" Enable persistent undo, to keep undo history even after the file is closed.
set undofile

" Show the current row and column at the bottom.
set ruler
" Always show the statusline.
set laststatus=2

" This is the default theme used for "dark" terminals.
colorscheme ron

" Show relative line numbers in normal mode, and absolute line numbers when
" unfocused or insert mode.
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Enables yanking into the system clipboard, so you can "yy" to yank the
" current line, and then paste it to another application.
set clipboard=unnamedplus
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " On mac, unnamed appears to do the right thing, and unnamedplus doesn't
    " work.
    set clipboard=unnamed
  endif
endif

" Indent a new line the same amount as the line just typed.
set autoindent
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

" Jump to search word as you type.
set incsearch
" Highlight search results.
set hlsearch

" Show a ruler at important columns.
let &colorcolumn="101"
" Make the ruler orange (goldenrod) instead of the default red.
highlight ColorColumn ctermbg=136
" Highlight any trailing whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

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
