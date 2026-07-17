local M = {}

M.setup = function()
  local sign_text = {
    [vim.diagnostic.severity.ERROR] = "",
    [vim.diagnostic.severity.WARN]  = "",
    [vim.diagnostic.severity.HINT]  = "",
    [vim.diagnostic.severity.INFO]  = "",
  }

  vim.diagnostic.config({
    virtual_text = false, -- Disable in-line messages (requires pressing leader-l-l to see message).
    signs = {
      text = sign_text, -- Nerd-font icons in the sign column (default is E/W/I/H letters).
    },
    severity_sort = true,
    float = {
      source = true, -- Show which LSP/linter produced each diagnostic in the float.
    },
  })

  -- Advertise blink.cmp's completion capabilities to every LSP server. This is
  -- the Neovim 0.11+ way to set defaults for all servers; mason-lspconfig then
  -- auto-enables the installed servers on top of this config.
  vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
  })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kgreenek_lsp_attach", { clear = true }),
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if not client then
        return
      end

      -- Let none-ls/formatters own formatting for these servers.
      if client.name == "ts_ls" or client.name == "lua_ls" then
        client.server_capabilities.documentFormattingProvider = false
      end
    end,
  })
end

return M
