return {
  "hrsh7th/nvim-cmp",
  version = false, -- Last release is way too old
  event = "InsertEnter",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
  },
  opts = function()
    -- Ghost text will look the same way comments do, thanks to linking to Comment group
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

    local cmp = require("cmp")
    local defaults = require("cmp.config.default")()
    return {
      -- Leaving this as a note, noinsert prevents insertion of first item from the list
      --completion = {
        --completeopt = "menu,menuone,noinsert",
      --},

      preselect = cmp.PreselectMode.Item,
      mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping(function(fallback)
          local col = vim.fn.col('.') - 1
          if cmp.visible() then
	    cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
          elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            fallback()
          else
            cmp.complete()
          end
        end, { "i", "c" }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
      }),
      -- Completion sources - https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "path" },
      }, {
        { name = "buffer" },
      }),
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
      sorting = defaults.sorting
    }
  end
}
