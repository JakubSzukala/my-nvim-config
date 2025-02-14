-- Below is set of default options. In the next section there is set of
-- auto commands that override these based on file type. For example, I like
-- C programms to expand tab to 8 spaces, but the same setting messes up
-- gdscript and probably Python.

-- Set leader character
vim.g.mapleader = " "

-- Cursor settings
vim.opt.guicursor = "i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150"

-- Line settings
vim.opt.nu = true
vim.opt.relativenumber = false

-- Indentation settings - see :h tabstop 1
vim.opt.tabstop = 8
vim.opt.softtabstop = 8
vim.opt.shiftwidth = 8
vim.opt.expandtab = false
vim.opt.smartindent = true

-- Line wrapping
vim.opt.wrap = false

-- File safety settings
vim.opt.swapfile = true
vim.opt.backup = false

-- Search settings
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

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

-- File type dependent overrides

-- C/C++ files
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.c", "*.h", "*.cpp", "*.hpp" },
  callback = function(_)
    vim.opt.softtabstop = 8
    vim.opt.shiftwidth = 8
  end
})

-- Lua files
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.lua" },
  callback = function(_)
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
  end
})
