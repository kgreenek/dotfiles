local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  return
end
local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  return
end
local mason_null_ls_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_ok then
  return
end
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end
local lsp_handlers = require("kgreenek.lsp.handlers")

-- These servers will be installed by default.
local servers = {
  "autotools_ls",
  "bashls",
  "clangd",
  "html",
  "jinja_lsp",
  "jsonls",
  "jsonnet_ls",
  "lua_ls",
  "pyright",
  "rust_analyzer",
  "taplo",
  "tsserver",
  "yamlls",
}

mason.setup()
mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

mason_null_ls.setup({
  ensure_installed = {
    "buildifier",
    "shellcheck",
    "shfmt",
    "stylua",
    "yapf",
  },
  automatic_installation = false,
  handlers = {},
})

for _, server in pairs(servers) do
  local opts = {
    on_attach = lsp_handlers.on_attach,
    capabilities = lsp_handlers.capabilities,
  }
  server = vim.split(server, "@")[1]
  local has_custom_opts, server_custom_opts = pcall(require, "kgreenek.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
  end
  lspconfig[server].setup(opts)
end
