return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000, -- load before other start plugins so the colorscheme is applied first
  opts = {
    transparent = true,
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme("tokyonight")
  end,
}
