local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

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
