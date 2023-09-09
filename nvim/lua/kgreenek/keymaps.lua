-- NOTE: All leader keymaps are configured using the which_key plugin.
-- SEE: which_key.lua

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--   *all modes* = "",

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
--NOTE: Keep this in sync with lazy.lua.
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<C-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<M-l>", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<M-h>", ":BufferLineMovePrev<CR>", opts)

-- Press jk fast to exit insert mode.
keymap("i", "jk", "<ESC>", opts)

-- Stay in visual indent mode when indenting.
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- When pasting over highlighted text, do not replace the clipboard with the
-- highlighted text that was just replaced. Keep the text that was just pasted.
keymap("v", "p", '"_dP', opts)

-- rnvimr keymaps
keymap("n", "<M-o>", ":RnvimrToggle<CR>", opts)
keymap("t", "<M-o>", "<C-\\><C-n>:RnvimrToggle<CR>", opts)
keymap("t", "<M-i>", "<C-\\><C-n>:RnvimrResize<CR>", opts)
keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)

vim.api.nvim_create_autocmd("FileType", {
  pattern = "bzl",
  callback = function()
    vim.keymap.set("n", "gd", vim.fn.GoToBazelDefinition, { buffer = true, desc = "Goto Definition" })
  end,
})

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  vim.notify("which_key not found in keymaps.lua")
  return
end

which_key.register({
  ["<leader>"] = {
    b = {
      name = "+Buffers",
      d = { "<cmd>bd<cr>", "Close buffer" },
      e = { "<cmd>Telescope buffers<cr>", "Explore buffers" },
      s = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory" },
      w = { "<cmd>w<cr>", "Write buffer" },
    },
    c = {
      name = "+Quickfix",
      c = { "<cmd>cclose<cr>", "Close quickfix list" },
      o = { "<cmd>copen<cr>", "Open quickfix list" },
    },
    e = { "<cmd>Ranger<cr>", "Explore files" },
    f = {
      name = "+Files",
      e = { "<cmd>RnvimrToggle<cr>", "Explore files" },
      f = { "<cmd>Telescope find_files<cr>", "Find file" },
      l = { "<cmd>Telescope live_grep<cr>", "Live grep" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open recent file" },
    },
    g = { "<cmd>HeaderguardAdd<cr>", "Header guard" },
    h = { name = "+Gitsigns hunks" },
    l = {
      name = "+LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
      c = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens action" },
      d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document diagnostics" },
      f = { "<cmd>lua vim.lsp.buf.format { async = true }<cr>", "Format" },
      h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
      I = { "<cmd>LspInstallInfo<cr>", "Installer info" },
      i = { "<cmd>LspInfo<cr>", "Info" },
      j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next diagnostic" },
      k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous diagnostic" },
      l = { '<cmd>lua vim.diagnostic.open_float(0, { border = "rounded" })<cr>', "Line dianostics" },
      q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace symbols" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document symbols" },
      w = { "<cmd>Telescope diagnostics<cr>", "Workspace diagnostics" },
    },
    w = { "<cmd>w<cr>", "Write buffer" },
  },
  g = {
    D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to declaration" },
    d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition" },
    i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to implmentation" },
    r = { "<cmd>lua vim.lsp.buf.references()<cr>", "Go to references" },
  },
  K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "LSP Hover" },
  ["[d"] = { '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<cr>', "Previous diagnostic" },
  ["]d"] = { '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<cr>', "Next diagnostic" },
})
