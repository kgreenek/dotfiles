return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- Auto-highlight other uses of the symbol under the cursor (LSP-based).
    -- Navigate with <a-n>/<a-p> (see keymaps.lua).
    words = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
                                       ██
                                      ░░
    ███████   █████   ██████  ██    ██ ██ ██████████
   ░░██░░░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██
    ░██  ░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██
    ░██  ░██░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██
    ███  ░██░░██████░░██████   ░░██   ░██ ███ ░██ ░██
   ░░░   ░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░]],
        keys = {
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
        },
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "projects", icon = " ", title = "Projects", indent = 2, padding = 1 },
        { section = "recent_files", icon = " ", title = "Recent Files", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
  },
}
