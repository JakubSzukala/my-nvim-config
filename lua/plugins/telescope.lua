return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false, -- TODO: Maybe this actually could be lazy
  build = ":checkhealth telescope", -- Check health after building
}
