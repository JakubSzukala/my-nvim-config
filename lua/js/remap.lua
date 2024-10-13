-- Switch to normal mode with jk
vim.keymap.set("i", "jk", "<Esc>")

-- Switch to file browser
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Telescope remaps
vim.keymap.set("n", "<leader>pf", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>ps", function() require("telescope.builtin").grep_string({search = vim.fn.input("Grep > ") }) end)
