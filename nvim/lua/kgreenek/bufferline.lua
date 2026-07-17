local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup({
  options = {
    indicator = { style = "underline" },
    -- No close (x) buttons: mouse is disabled; close buffers via <leader>bd.
    show_buffer_close_icons = false,
    show_close_icon = false,
    separator_style = { "", "" }, -- no separators; buffers are distinguished by bg contrast
    max_name_length = 30,
    max_prefix_length = 30,
    tab_size = 21,
    diagnostics = "nvim_lsp", -- show LSP diagnostics on the buffer tabs
  },
  -- Give inactive buffers a solid background so the transparent active buffer
  -- stands out. tokyonight handles the rest (text color, bold, underline).
  highlights = {
    fill = { bg = { attribute = "bg", highlight = "TabLine" } },
    background = { bg = { attribute = "bg", highlight = "TabLine" } },
    buffer_visible = { bg = { attribute = "bg", highlight = "TabLine" } },
    modified = { bg = { attribute = "bg", highlight = "TabLine" } },
    modified_visible = { bg = { attribute = "bg", highlight = "TabLine" } },
    duplicate = { bg = { attribute = "bg", highlight = "TabLine" } },
    duplicate_visible = { bg = { attribute = "bg", highlight = "TabLine" } },
  },
})
