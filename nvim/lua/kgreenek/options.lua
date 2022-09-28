-- Allow switching buffers without saving the current buffer first.
vim.opt.hidden = true
-- Show the current row and column at the bottom.
vim.opt.ruler = true
-- Always show the statusline.
vim.opt.laststatus = 2
-- No need to show text like -- INSERT -- in neovim.
vim.opt.showmode = false
-- Don't give ins-completion-menu messages.
vim.opt.shortmess:append("c")
-- Faster UI update for better overall performance of many plugins.
vim.opt.updatetime = 250
-- Give the commandline a bit more room for messages.
vim.opt.cmdheight = 2
-- Enable 24-bit RGB color in the TUI.
vim.opt.termguicolors = true
-- Always show the sign column, otherwise it shifts the text contantly.
vim.opt.signcolumn = "yes"
-- Disable mouse (enabled by default in neovim v0.8).
vim.opt.mouse = nil

-- Indent a new line the same amount as the line just typed.
vim.opt.autoindent = true
-- Size of a hard tabstop.
vim.opt.tabstop = 2
-- Size of an "indent".
vim.opt.shiftwidth = 2
-- A combination of spaces and tabs are used to simulate tab stops at a width
-- other than the (hard)tabstop.
vim.opt.softtabstop = 2
-- Make "tab" insert indents instead of tabs at the beginning of a line.
vim.opt.smarttab = true
-- Always uses spaces instead of tab characters.
vim.opt.expandtab = true

-- Jump to search word as you type.
vim.opt.incsearch = true
-- Highlight search results.
vim.opt.hlsearch = true

-- Show a ruler at important columns.
vim.opt.colorcolumn = "101"
-- Make the ruler orange (goldenrod) instead of the default red.
vim.cmd([[ highlight ColorColumn ctermbg=136 ]])
-- Highlight any trailing whitespace.
vim.cmd([[
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+$/
]])

-- Save unfo file to persist undo history between sessions.
vim.opt.undofile = true
-- Prevent the text from being wrapped automatically.
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
-- Allow backspacing over autoindent, line breaks, and the start of insert.
vim.opt.backspace = "indent,eol,start"
-- Enables yanking into the system clipboard, so you can "yy" to yank the
-- current line, and then paste it to another application.
vim.opt.clipboard = "unnamedplus"
-- Don't allow the cursor to get to close to the bottom or side of the window
-- without scrolling.
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
-- Treat words with a - in the middle as one word when navigating.
vim.opt.iskeyword:append("-")

-- Show relative line numbers in normal mode, and absolute line numbers when
-- unfocused or insert mode.
vim.opt.number = true
vim.opt.relativenumber = true
vim.cmd([[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  augroup END
]])

-- Treat ROS launch files as xml.
vim.cmd([[ autocmd BufNewFile,BufRead *.launch set syntax=xml ]])
