local M = {}

M.capabilities = require("blink.cmp").get_lsp_capabilities()

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
      text = sign_text, -- show signs
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      source = true,
    },
  })

end

local function lsp_highlight_document(client)
  local illuminate_status_ok, illuminate = pcall(require, "illuminate")
  if not illuminate_status_ok then
    return
  end
  illuminate.on_attach(client)
end

M.on_attach = function(client, _)
  if client.name == "ts_ls" then
    client.server_capabilities.documentFormattingProvider = false
  end
  if client.name == "lua_ls" then
    client.server_capabilities.documentFormattingProvider = false
  end
  lsp_highlight_document(client)
end

return M
