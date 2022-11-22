-- List of great color schemes that support neovim / treesitter:
-- https://github.com/rockerBOO/awesome-neovim#colorscheme

-- Tokyonight must be setup before setting the colorscheme.
local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
  return
end

tokyonight.setup({
  transparent = true,
})

local colorscheme = "tokyonight"
status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
