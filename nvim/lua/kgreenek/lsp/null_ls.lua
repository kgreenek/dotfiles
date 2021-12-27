local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  vim.notify("null-ls not found")
  return
end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.buildifier,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.yapf,
  },
})
