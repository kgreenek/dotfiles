-- Install plugins. This must come first.
require("kgreenek.lazy")

-- The colorscheme is applied by the tokyonight plugin spec (priority 1000), so it is already set
-- by the time these run.

-- Vim config.
require("kgreenek.keymaps")
require("kgreenek.options")

-- LSP setup (eager).
require("kgreenek.lsp")
