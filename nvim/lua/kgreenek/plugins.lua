-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer. Close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install plugins
return packer.startup(function(use)
  use("JamshedVesuna/vim-markdown-preview")
  use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })
  use("bazelbuild/vim-ft-bzl")
  use("cstrahan/vim-capnp")
  use("drmikehenry/vim-headerguard")
  use("folke/which-key.nvim")
  use("kevinhwang91/rnvimr")
  use("kyazdani42/nvim-web-devicons")
  use("lewis6991/gitsigns.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")
  use("nvim-telescope/telescope.nvim") -- Depends: plenary.nvim, nvim-treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("tikhomirov/vim-glsl")
  use("tpope/vim-fugitive")
  use("wbthomason/packer.nvim") -- Have packer manage itself

  -- Themes
  use("folke/tokyonight.nvim")

  -- cmp plugins
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")
  use("hrsh7th/cmp-path")
  use("hrsh7th/nvim-cmp") -- The completion plugin
  use("saadparwaiz1/cmp_luasnip") -- snippet completions

  -- snippets
  use("L3MON4D3/LuaSnip") --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- LSP
  use("jose-elias-alvarez/null-ls.nvim")
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
