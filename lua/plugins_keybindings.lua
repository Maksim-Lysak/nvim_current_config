local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- bufferline
keymap('n', '>', ':BufferLineCycleNext<CR>', opts)
keymap('n', '<', ':BufferLineCyclePrev<CR>', opts)

-- nvim-tree
keymap("", 'nf', ':NvimTreeFindFile<CR>', opts)
keymap("", 'nn', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', opts)

-- hop 
keymap("", ".l", ":HopLine<cr>", opts)
keymap("", ".s", ":HopChar2<cr>", opts)
keymap("", ".w", ":HopWordCurrentLine<cr>", opts)

-- telescope
keymap("", ".fb", ":Telescope buffers<CR>", opts)
keymap("", ".fg", ":Telescope live_grep<CR>", opts)
keymap("", ".fh", ":Telescope help_tags<CR>", opts)
keymap("", ".ff", ":Telescope find_files<CR>", opts)

-- Trouble
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)

