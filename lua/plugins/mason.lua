return {
  "williamboman/mason.nvim",
  cmd = "Mason", -- Lazy load on this command
  build = ":MasonUpdate", -- When building/updating mason also update registries
  opts_extend = { "ensure_installed" },
  opts = {
    ensure_installed = {
      "stylua", -- TODO: Setup this
      "lua-language-server",
      "shfmt",
      "clangd",
      "pyright"
    }
  },
  -- config function will run when plugin loads. We override it here to add custom logic.
  -- Default config will run require("pluginname").setup(opts) so we also do that here.
  config = function(_, opts)
    -- Run default setup
    require("mason").setup(opts)

    -- Iterate over language servers in opts.ensure_installed and check if they are
    -- installed. If not, then install them.
    -- https://github.com/williamboman/mason.nvim/blob/main/doc/mason.txt#L468
    for _, ls in ipairs(opts.ensure_installed) do
      local p = require("mason-registry").get_package(ls)
      if not p:is_installed() then
        p:install() -- TODO: We could do some error handling here?
      end
    end

    -- Subscribe to package:install:failed event and print deffered message
    -- https://github.com/williamboman/mason.nvim/blob/main/doc/reference.md#registry-events
    require("mason-registry"):on("package:install:failed",
      vim.schedule_wrap(
        function(pkg, _)
	  print(string.format("Failed to install: %s", pkg.name))
        end))
  end
}
