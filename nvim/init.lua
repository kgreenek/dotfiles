-- Install plugins. This must come first.
require("kgreenek.lazy")

-- Vim config.
require("kgreenek.colorscheme")
require("kgreenek.keymaps")
require("kgreenek.options")

-- Plugin config.
require("kgreenek.bufferline")
require("kgreenek.cmp")
require("kgreenek.fidget")
require("kgreenek.gitsigns")
require("kgreenek.lsp")
require("kgreenek.ranger")
require("kgreenek.startify")
require("kgreenek.telescope")
require("kgreenek.treesitter")
require("kgreenek.vim_headerguard")
require("kgreenek.vim_markdown_preview")
require("kgreenek.which_key")

-- This must come after telescope.
require("kgreenek.chatgpt")
