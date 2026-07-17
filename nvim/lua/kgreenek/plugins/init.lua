return {
  "MunifTanjim/nui.nvim",
  "RRethy/vim-illuminate", -- Illuminate other uses of current word/symbol under cursor
  { "akinsho/bufferline.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

  "cstrahan/vim-capnp",
  "nvim-lua/plenary.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  "nvim-tree/nvim-web-devicons",
  "echasnovski/mini.nvim",
  "tikhomirov/vim-glsl",
  "tpope/vim-fugitive",
  "folke/which-key.nvim",

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
}
