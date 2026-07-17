-- Formatting. Replaces the formatting half of the old none-ls setup. The
-- underlying CLI tools are installed via mason-tool-installer (see lsp/mason.lua).
-- Formatting is triggered manually via <leader>lf (see keymaps.lua).
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "yapf" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      yaml = { "yamlfmt" },
      bzl = { "buildifier" },
    },
  },
}
