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

-- Use a protected call so we don't error out on first use
local lazy_status_ok, lazy = pcall(require, "lazy")
if not lazy_status_ok then
  return
end

-- Install plugins
return lazy.setup({
  "JamshedVesuna/vim-markdown-preview",
  "MunifTanjim/nui.nvim",
  "RRethy/vim-illuminate", -- Illuminate other uses of current word/symbol under cursor
  { "akinsho/bufferline.nvim", dependencies = "kyazdani42/nvim-web-devicons" },
  "antoinemadec/FixCursorHold.nvim", -- This is needed to fix lsp doc highlight
  "cstrahan/vim-capnp",
  "drmikehenry/vim-headerguard",
  "folke/which-key.nvim",
  "francoiscabrol/ranger.vim",
  "kyazdani42/nvim-web-devicons",
  { "j-hui/fidget.nvim", tag = "legacy" },
  "lewis6991/gitsigns.nvim",
  "lewis6991/impatient.nvim",
  "mhinz/vim-startify",
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  },
  "rbgrouleff/bclose.vim", -- Needed for ranger to work with neovim.
  "tikhomirov/vim-glsl",
  "tpope/vim-fugitive",
  "williamboman/mason.nvim", -- Simple to use language server installer
  "williamboman/mason-lspconfig.nvim",

  -- Themes
  "folke/tokyonight.nvim",

  -- cmp plugins
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-path",
  "hrsh7th/nvim-cmp", -- The completion plugin

  -- LSP
  "jose-elias-alvarez/null-ls.nvim",
  "tamago324/nlsp-settings.nvim", -- For jsonls default schemas
  "neovim/nvim-lspconfig",
  "jay-babu/mason-null-ls.nvim",

  -- bazel
  "google/vim-maktaba",
  { "bazelbuild/vim-bazel", dependencies = { "google/vim-maktaba" } },
  { "alexander-born/bazel.nvim", dependencies = { "nvim-treesitter/nvim-treesitter" } },
  --"alexander-born/cmp-bazel",

  {
    "jackMort/ChatGPT.nvim",
    --config = function()
    --  require("chatgpt").setup()
    --end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
})
