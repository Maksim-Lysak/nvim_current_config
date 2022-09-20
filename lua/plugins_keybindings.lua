local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- bufferline
keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', opts)
keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)

-- nvim-tree
keymap("", 'nn', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', opts)
keymap("", 'nf', ':NvimTreeFindFile<CR>', opts)

-- hop 
keymap("", ".w", ":HopWordCurrentLine<cr>", opts)
keymap("", ".l", ":HopLine<cr>", opts)
keymap("", ".s", ":HopChar2<cr>", opts)
