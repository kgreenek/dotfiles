local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")

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
  "starpls",
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
  -- stylua ships an `lsp/stylua.lua` config in nvim-lspconfig, so mason would
  -- otherwise auto-enable `stylua --lsp` as a language server just because the
  -- formatter is installed. conform.nvim already owns Lua formatting, so exclude
  -- it to avoid a redundant client.
  automatic_enable = {
    exclude = { "stylua" },
  },
})

-- CLI formatters/linters consumed by conform.nvim and nvim-lint.
mason_tool_installer.setup({
  ensure_installed = {
    "buildifier",
    "shellcheck",
    "shfmt",
    "stylua",
    "yamlfmt",
    "yapf", -- Disable when ruff is enabled
  },
})
