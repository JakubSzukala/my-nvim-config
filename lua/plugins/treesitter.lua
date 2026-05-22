return {
	"nvim-treesitter/nvim-treesitter",
	version = false, -- last release is way too old
	build = ":TSUpdate", -- Together with treesitter, update parsers
	event = { "VeryLazy" }, -- Load after VimEnter (startup stuff, loading init.lua, creating windows)
	lazy = vim.fn.argc(-1) == 0, -- Don't lazy load when we open file with vim from command line
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" }, -- Lazy load on these commands
	opts = {
		sync_install = true,
		auto_install = true,
		prefer_git = true,
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
			"python",
			"regex",
			"toml",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
			"gdscript",
			"go"
		},
	},
	config = function(_, opts)
		local treesitter = require("nvim-treesitter")
		treesitter.setup(opts)
	end,
}
