-- List of great color schemes that support neovim / treesitter:
-- https://github.com/rockerBOO/awesome-neovim#colorscheme

-- This colorscheme is provided by the tokyonight plugin.
local colorscheme = "tokyonight"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
