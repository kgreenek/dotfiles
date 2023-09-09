-- Install plugins. This must come first.
require("kgreenek.lazy")

-- Vim config.
require("kgreenek.colorscheme")
require("kgreenek.keymaps")
require("kgreenek.options")

-- Plugin config.
-- NOTE: This must be done after the colorscheme is set.
require("kgreenek.bufferline")
require("kgreenek.lsp")
