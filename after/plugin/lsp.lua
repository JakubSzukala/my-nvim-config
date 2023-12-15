local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- TAB Autocomplete
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
  })
})

-- LSP Servers manager
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
	  -- When updating this list ensure to update treesitter
	  'lua_ls',
	  'pyright',
	  'rust_analyzer',
	  'clangd'
  },
  handlers = {
    lsp_zero.default_setup,
  },
})

-- GDScrip LSP works from editor so it is managed separately
require'lspconfig'.gdscript.setup{}
