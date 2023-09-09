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
  "rbgrouleff/bclose.vim", -- Needed for ranger to work with neovim.
  "tikhomirov/vim-glsl",
  "tpope/vim-fugitive",

  -- cmp plugins
  "alexander-born/cmp-bazel",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-path",

  -- LSP
  "jose-elias-alvarez/null-ls.nvim",
  "neovim/nvim-lspconfig",
  "tamago324/nlsp-settings.nvim", -- For jsonls default schemas
  "williamboman/mason.nvim", -- Simple to use language server installer
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      "williamboman/mason.nvim",
    },
  },

  -- bazel
  "google/vim-maktaba",
  { "bazelbuild/vim-bazel", dependencies = { "google/vim-maktaba" } },
  { "alexander-born/bazel.nvim", dependencies = { "nvim-treesitter/nvim-treesitter" } },
}
