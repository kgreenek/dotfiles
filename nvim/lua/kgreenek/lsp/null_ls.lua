local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  vim.notify("null-ls not found")
  return
end

-- NOTE: The null-ls sources are setup by the mason-null-ls plugin in ./mason.lua
null_ls.setup({
  update_in_insert = true,
})
