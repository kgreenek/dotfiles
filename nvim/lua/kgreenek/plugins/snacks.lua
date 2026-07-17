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
          { icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
          { icon = " ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "S", desc = "Select Session", action = function() require("persistence").select() end },
          { icon = " ", key = "c", desc = "Config", action = ":e $MYVIMRC" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "projects", icon = " ", title = "Projects", indent = 2, padding = 1 },
        { section = "recent_files", icon = " ", title = "Recent Files", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
  },
}
