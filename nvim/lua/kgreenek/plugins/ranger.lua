return {
  "francoiscabrol/ranger.vim",
  dependencies = { "rbgrouleff/bclose.vim" }, -- Needed for ranger to work with neovim.
  config = function()
    -- Open ranger when vim open a directory.
    vim.g.ranger_replace_netrw = 1
    -- Disable default keymap.
    vim.g.ranger_map_keys = 0
  end,
}
