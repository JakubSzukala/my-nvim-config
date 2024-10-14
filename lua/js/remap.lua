-- Switch to normal mode with jk
vim.keymap.set("i", "jk", "<Esc>")

-- Switch to file browser
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Telescope remaps
vim.keymap.set("n", "<leader>pf", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>ps", function() require("telescope.builtin").grep_string({search = vim.fn.input("Grep > ") }) end)

-- Grab and shift text in visual mode (doesn't work at the bottom of the file)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Allow jumping over folded line
-- TODO: Do this only for certain filetypes like markdown where line wrapping is nice
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Keep the cursor in one place while half page jumping and searching
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
