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

-- illumuniate keymaps
keymap("n", "<a-n>", '<cmd>lua require("illuminate").next_reference({wrap=true})<cr>', opts)
keymap("n", "<a-p>", '<cmd>lua require("illuminate").next_reference({reverse=true,wrap=true})<cr>', opts)

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

which_key.add({
  { "<leader>b", group = "Buffers" },
  { "<leader>bd", "<cmd>bd<cr>", desc = "Close buffer" },
  { "<leader>be", "<cmd>Telescope buffers<cr>", desc = "Explore buffers" },
  { "<leader>bs", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort by directory" },
  { "<leader>bw", "<cmd>w<cr>", desc = "Write buffer" },
  { "<leader>c", group = "Quickfix" },
  { "<leader>cc", "<cmd>cclose<cr>", desc = "Close quickfix list" },
  { "<leader>co", "<cmd>copen<cr>", desc = "Open quickfix list" },
  { "<leader>f", group = "Files" },
  { "<leader>fe", "<cmd>RnvimrToggle<cr>", desc = "Explore files" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find file" },
  { "<leader>fl", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open recent file" },
  { "<leader>g", "<cmd>HeaderguardAdd<cr>", desc = "Header guard" },
  { "<leader>h", group = "Gitsigns hunks" },
  { "<leader>l", group = "LSP" },
  { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer info" },
  { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace symbols" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code action" },
  { "<leader>lc", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens action" },
  { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
  { "<leader>lf", "<cmd>lua vim.lsp.buf.format { async = true }<cr>", desc = "Format" },
  { "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover" },
  { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
  { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next diagnostic" },
  { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Previous diagnostic" },
  { "<leader>ll", '<cmd>lua vim.diagnostic.open_float(0, { border = "rounded" })<cr>', desc = "Line dianostics" },
  { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
  { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document symbols" },
  { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
  { "<leader>w", "<cmd>w<cr>", desc = "Write buffer" },
  { "K", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "LSP Hover" },
  { "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<cr>', desc = "Previous diagnostic" },
  { "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<cr>', desc = "Next diagnostic" },
  { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Go to declaration" },
  { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Go to definition" },
  { "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Go to implmentation" },
  { "gr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "Go to references" },
})
