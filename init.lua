require("config.lazy")

-- Switch to normal mode with jk
vim.keymap.set("i", "jk", "<Esc>")

-- Switch to file browser
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
