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
  -- Auto-installs the formatters/linters (consumed by conform.nvim + nvim-lint).
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
  },
}
