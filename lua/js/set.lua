-- Set leader character
vim.g.mapleader = " "

-- Cursor settings
vim.opt.guicursor = "i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150"

-- Line settings
vim.opt.nu = true
vim.opt.relativenumber = false

-- Indentation settings
vim.opt.tabstop = 8
vim.opt.softtabstop = 8
vim.opt.shiftwidth = 8
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Line wrapping
vim.opt.wrap = false

-- File safety settings
vim.opt.swapfile = true
vim.opt.backup = false

-- Search settings
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Looks
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"

-- Style
vim.opt.signcolumn = "yes"
vim.opt.list = true

-- Misc
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
