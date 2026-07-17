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
    separator_style = "thin",
    max_name_length = 30,
    max_prefix_length = 30,
    tab_size = 21,
    diagnostics = "nvim_lsp", -- show LSP diagnostics on the buffer tabs
  },
})
