return {
  "MunifTanjim/nui.nvim",
  "RRethy/vim-illuminate", -- Illuminate other uses of current word/symbol under cursor
  { "akinsho/bufferline.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  "antoinemadec/FixCursorHold.nvim", -- This is needed to fix lsp doc highlight

  "cstrahan/vim-capnp",
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  "nvim-tree/nvim-web-devicons",
  "echasnovski/mini.nvim",
  "rbgrouleff/bclose.vim", -- Needed for ranger to work with neovim.
  "tikhomirov/vim-glsl",
  "tpope/vim-fugitive",
  "folke/which-key.nvim",

  -- cmp plugins
  "alexander-born/cmp-bazel",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-path",

  -- LSP
  "nvimtools/none-ls.nvim",
  "neovim/nvim-lspconfig",
  "tamago324/nlsp-settings.nvim", -- For jsonls default schemas
  "mason-org/mason.nvim",
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim" },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "nvimtools/none-ls.nvim",
      "mason-org/mason.nvim",
    },
  },

  -- bazel
  "google/vim-maktaba",
  { "bazelbuild/vim-bazel", dependencies = { "google/vim-maktaba" } },
}
