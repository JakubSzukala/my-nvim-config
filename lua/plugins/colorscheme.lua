return {
  {
    -- "folke/tokyonight.nvim",
    "ericbn/vim-solarized",
    --"sainnhe/gruvbox-material",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme solarized]])
      --vim.opt.background = "light"
      vim.opt.background = "dark"
    end,
  }
}
