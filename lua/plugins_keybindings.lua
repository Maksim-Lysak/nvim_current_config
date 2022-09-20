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

-- telescope
keymap("", ".ff", ":Telescope find_files<CR>", opts)
keymap("", ".fg", ":Telescope live_grep<CR>", opts)
keymap("", ".fb", ":Telescope buffers<CR>", opts)
keymap("", ".fh", ":Telescope help_tags<CR>", opts)
