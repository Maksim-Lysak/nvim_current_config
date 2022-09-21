-- theme
require('onedark').setup {
    style = 'warm'
}
require('onedark').load()

-- telescope
require('telescope').setup()

-- luline
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

-- nvim-tree
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- hop
require("hop").setup({
	keys = 'etovxqpdygfblzhckisuran'
})

-- nvim-comment
require('nvim_comment').setup()

-- bufferline
require("bufferline").setup{
	options = {
		show_buffer_close_icons = false,
    show_close_icon = false,
    offsets = {
        {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true
        }
    }
	}
}

-- nvim-autopairs
require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt" , "vim" },
})

-- tree-sitter
require'nvim-treesitter.configs'.setup {

	-- Нужные парсеры
	ensure_installed = { 
		"css", "html", "json", "scss", "javascript", "python", "lua", "typescript","vue", "dockerfile"
	},

	-- Устанавливать парсеры синхронно
	sync_install = false,

	-- Подсветка
	highlight = {

		-- Включить расшируение
		enable = true,
		disable = {},
	},

	indent = {

		-- Включить indent
		enable = false,
		disable = {},
	}
}
