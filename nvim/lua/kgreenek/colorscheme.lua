-- List of great color schemes that support neovim / treesitter:
-- https://github.com/rockerBOO/awesome-neovim#colorscheme

-- These must be set before calling colorscheme below.
vim.g.tokyonight_style = "night"
vim.g.tokyonight_transparent = true
local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
