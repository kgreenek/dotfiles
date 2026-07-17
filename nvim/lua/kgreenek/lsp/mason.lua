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

-- These servers will be installed by default.
local servers = {
  "autotools_ls",
  "bashls",
  "clangd",
  "html",
  "jinja_lsp",
  "jsonls",
  "jsonnet_ls",
  "lemminx",
  "lua_ls",
  "pyright", -- Disable when ruff is enabled
  --"ruff",
  "rust_analyzer",
  "taplo",
  "ts_ls",
  "yamlls",
}

-- Apply per-server config overrides from lua/kgreenek/lsp/settings/<server>.lua.
-- These merge on top of the defaults shipped by nvim-lspconfig and the global
-- capabilities set in handlers.lua. mason-lspconfig then auto-enables the
-- installed servers (automatic_enable defaults to true), which reads this config.
for _, server in ipairs(servers) do
  local has_custom_opts, server_custom_opts = pcall(require, "kgreenek.lsp.settings." .. server)
  if has_custom_opts then
    vim.lsp.config(server, server_custom_opts)
  end
end

mason.setup()
mason_lspconfig.setup({
  ensure_installed = servers,
})

mason_null_ls.setup({
  ensure_installed = {
    "buildifier",
    "shellcheck",
    "shfmt",
    "stylua",
    "yamlfmt",
    "yapf", -- Disable when ruff is enabled
  },
  automatic_installation = false,
  handlers = {},
})
