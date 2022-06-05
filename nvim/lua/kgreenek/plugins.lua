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
  vim.cmd("packadd packer.nvim")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- This needs to be loaded before any other plugin in order to work.
pcall(require, "impatient")

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- TODO(kgreenek): Is this necessary?
--require("packer_compiled")

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install plugins
return packer.startup({
  function(use)
    use("JamshedVesuna/vim-markdown-preview")
    use("RRethy/vim-illuminate") -- Illuminate other uses of current word/symbol under cursor
    use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })
    use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
    use("cstrahan/vim-capnp")
    use("drmikehenry/vim-headerguard")
    use("folke/which-key.nvim")
    use("kevinhwang91/rnvimr")
    use("kyazdani42/nvim-web-devicons")
    use("j-hui/fidget.nvim")
    use("lewis6991/gitsigns.nvim")
    use("lewis6991/impatient.nvim")
    use("mhinz/vim-startify")
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

    -- LSP
    use("jose-elias-alvarez/null-ls.nvim")
    use("tamago324/nlsp-settings.nvim") -- For jsonls default schemas
    use("neovim/nvim-lspconfig")
    use("williamboman/nvim-lsp-installer")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end,
  config = {
    -- Move to lua dir so impatient.nvim can cache it.
    compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
  },
})
