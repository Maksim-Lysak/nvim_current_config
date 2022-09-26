-- theme onedark
-- require('onedark').setup {
--     style = 'warm'
-- }
-- require('onedark').load()

-- theme darkplus
vim.cmd[[colorscheme darkplus]]

-- telescope
require('telescope').setup()

-- nvim-surround
require('nvim-surround').setup()

-- luline
require('lualine').setup {
  options = {
    icons_enabled = true,
    -- theme = 'onedark',
		theme = 'auto',
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
	-- Включить автозакрытие тегов
	autotag = {
    enable = true,
  },
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

-- trouble
require('trouble').setup({})

-- LSP
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
		'sumneko_lua',            -- Lua
		'tsserver',               -- Typescript, Javascript
		'volar'                   -- Vue
	},
}

-- Возможности редактора
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- удалить ошибки диагностики в левом столбце (SignColumn)
vim.diagnostic.config({signs=false})
-- Добавляем возможность использовать сниппеты
capabilities.textDocument.completion.completionItem.snippetSupport = true

for _, server in ipairs(lspinstaller.get_installed_servers()) do
  lspconfig[server.name].setup{
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  }
end

-- LSP INSTALLER
require("nvim-lsp-installer").setup({
	  automatic_installation = true,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- lsp config
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

-- CMP
local cmp = require('cmp')
local lspkind = require('lspkind')
cmp.setup{
	snippet = {

		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require'luasnip'.lsp_expand(args.body) -- Luasnip expand
		end,
	},

	-- Клавиши, которые будут взаимодействовать в nvim-cmp
    mapping = cmp.mapping.preset.insert({
      ['<M-[>'] = cmp.mapping.scroll_docs(-4),
      ['<M-]>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<M-e>'] = cmp.mapping.abort(),
      ['<Tab>'] = cmp.mapping.confirm({ select = true }),
			['<M-p>'] = cmp.mapping.select_prev_item(),
			['<M-n>'] = cmp.mapping.select_next_item()
    }),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },                -- LSP 👄
		{ name = 'nvim_lsp_signature_help' }, -- Помощь при введении параметров в методах 🚁
		{ name = 'luasnip' },                 -- Luasnip 🐌
		{ name = 'buffer' },                  -- Буфферы 🐃
		{ name = 'path' },                    -- Пути 🪤
		{ name = 'cmdline'}
	}, {
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol', -- show only symbol annotations
			maxwidth = 50,   -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
		})
	}
}
  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
