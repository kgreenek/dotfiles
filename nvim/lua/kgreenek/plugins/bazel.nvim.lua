return {
  "alexander-born/bazel.nvim",
  config = function()
    -- Work-around to make bazel auto-complete work.
    vim.g.bazel_cmd = "bazel"
  end,
  dependencies = { "nvim-treesitter/nvim-treesitter" },
}
