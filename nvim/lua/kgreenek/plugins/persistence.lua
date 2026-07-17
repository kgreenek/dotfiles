return {
  -- Session management. Sessions are auto-saved per working directory on exit,
  -- and restored via the dashboard or the <leader>s keymaps (see keymaps.lua).
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {},
}
