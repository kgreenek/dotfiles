local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local lspconfig = require("lspconfig")

-- These servers will be installed by default.
local servers = {
  "bashls",
  "clangd",
  "html",
  "jsonls",
  "pyright",
  "sumneko_lua",
  "tsserver",
  "yamlls",
}

lsp_installer.setup({
  ensure_installed = servers,
})

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("kgreenek.lsp.handlers").on_attach,
    capabilities = require("kgreenek.lsp.handlers").capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "kgreenek.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
  end
  lspconfig[server].setup(opts)
end
