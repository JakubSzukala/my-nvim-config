-- Quit file and enter file browser
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Remap Esc to jk
vim.keymap.set("i", "jk", "<Esc>")

-- Grab and shift text in visual mode (doesn't work at the bottom of the file)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Allow jumping over folded line
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Keep the cursor in one place while half page jumping and searching
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Substitute word under the cursor over entire file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {silent=true})

vim.keymap.set("i", "<F9>", "<cmd>!love . 'Hi'<CR>", {silent=true})
vim.keymap.set("n", "<F9>", "<cmd>!love . 'Hi'<CR>", {silent=true})
