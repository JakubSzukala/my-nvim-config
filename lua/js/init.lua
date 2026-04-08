local npm_global_bin = os.getenv("HOME") .. "/.npm-global/bin"
if vim.fn.isdirectory(npm_global_bin) == 1 then
	vim.env.PATH = npm_global_bin .. ":" .. vim.env.PATH
else
	print("Warning: npm global bin directory not found at " .. npm_global_bin)
end

require("js.set")
require("js.remap")
