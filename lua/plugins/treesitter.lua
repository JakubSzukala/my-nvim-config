return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- last release is way too old
  build = ":TSUpdate", -- Together with treesitter, update parsers
  event = { "VeryLazy" }, -- Load after VimEnter (startup stuff, loading init.lua, creating windows)
  lazy = vim.fn.argc(-1) == 0, -- Don't lazy load when we open file with vim from command line
  init = function(plugin)
    -- PERF: add nvim-treesitter queries to the runtimepath and it's custom query predicates early
    -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
    -- no longer trigger the **nvim-treesitter** module to be loaded in time.
    -- Luckily, the only things that those plugins need are the custom queries, which we make available
    -- during startup. Source: http://www.lazyvim.org/plugins/treesitter
    require("lazy.core.loader").add_to_rtp(plugin)
    require("nvim-treesitter.query_predicates")
  end,
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" }, -- Lazy load on these commands
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "bash",
      "c",
      "diff",
      "json",
      "query",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "printf",
      "python",
      "regex",
      "toml",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },
  }
}
