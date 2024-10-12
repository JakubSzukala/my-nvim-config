return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  cmd = "Telescope",
  build = ":checkhealth telescope", -- Check health after building
  keys = { -- http://www.lazyvim.org/configuration/plugins#%EF%B8%8F-adding--disabling-plugin-keymaps
    { "<leader>pf", mode = { "n" }, require("telescope.builtin").find_files},
    { "<leader>ps", mode = { "n" },
      function()
        require("telescope.builtin").grep_string({search = vim.fn.input("Grep > ") })
      end
    }
  }
}
