local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("kgreenek.lsp.mason")
require("kgreenek.lsp.null_ls")
require("kgreenek.lsp.handlers").setup()
