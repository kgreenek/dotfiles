-- Automatically install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if vim.fn.empty(vim.fn.glob(lazypath)) > 0 then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- This must be done before plugins are installed with lazy or the wrong leader will be used.
-- NOTE: Keep this in sync with keymaps.lua.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- It is safe to assume this is always installed because it is git cloned above.
local lazy = require("lazy")

-- Install plugins
return lazy.setup("kgreenek/plugins")
