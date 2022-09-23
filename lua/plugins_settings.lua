local cmp = require('cmp')
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

-- cmp
cmp.setup{
	snippet = {

		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require'luasnip'.lsp_expand(args.body) -- Luasnip expand
		end,
	},

	-- Клавиши, которые будут взаимодействовать в nvim-cmp
	mapping = {

		-- Вызов меню автодополнения
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<CR>'] = cmp.config.disable,                      -- Я не люблю, когда вещи автодополняются на <Enter>
		['<C-y>'] = cmp.mapping.confirm({ select = true }), -- А вот на <C-y> вполне ок

		-- Используем <C-e> для того чтобы прервать автодополнение
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(), -- Прерываем автодополнение
			c = cmp.mapping.close(), -- Закрываем автодополнение
		}),
		['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
		['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
	},

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },                -- LSP 👄
		{ name = 'nvim_lsp_signature_help' }, -- Помощь при введении параметров в методах 🚁
		{ name = 'luasnip' },                 -- Luasnip 🐌
		{ name = 'buffer' },                  -- Буфферы 🐃
		{ name = 'path' },                    -- Пути 🪤
	}, {
	}),
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

-- lsp-installer
-- Берем плагин для установки LSP
local lspinstaller = require'nvim-lsp-installer'

-- Конфигурация для LSP
local lspconfig = require'lspconfig'

-- Конфигурируем lsp-installer
lspinstaller.setup{
	ensure_installed = {
		'cssls',                  -- CSS
		'emmet_ls',               -- HTML
		'jedi_language_server',   -- Python
		'tsserver',               -- Typescript, Javascript
		'volar'                   -- Vue
	},
}

-- Возможности редактора
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Добавляем возможность использовать сниппеты
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- ОТКЛЮЧЕНИЕ ВИРТУАЛЬНОГО ТЕКСТА
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)

for _, server in ipairs(lspinstaller.get_installed_servers()) do
  lspconfig[server.name].setup{
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  }
end
