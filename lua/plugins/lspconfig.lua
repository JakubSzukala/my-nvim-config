return {
  "neovim/nvim-lspconfig",
  events = { "BufEnter" },
  dependencies = {
    "mason.nvim",
    { "williamboman/mason-lspconfig.nvim" },
  },
  opts = {
    inlay_hints = {
      enabled = true,
    },
    servers = {
      lua_ls = {
        -- mason = false, -- set to false if you don't want this server to be installed with mason
        -- Use this to add any additional keymaps
        -- for specific lsp servers
        -- ---@type LazyKeysSpec[]
        -- keys = {},
        settings = {
          Lua = {
            workspace = {
      	      checkThirdParty = false,
            },
            codeLens = {
      	      enable = true,
            },
            completion = {
      	      callSnippet = "Replace",
            },
            doc = {
      	      privateName = { "^_" },
            },
            hint = {
      	      enable = true,
      	      setType = false,
      	      paramType = true,
      	      paramName = "Disable",
      	      semicolon = "Disable",
      	      arrayIndex = "Disable",
            },
          },
        },
      },
    },
  },
  config = function(_, _)
    local lspconfig = require("lspconfig")

    -- Notes:
    -- `setup{}` wraps |vim.lsp.start_client()| or |vim.lsp.buf_attach_client()| these 
    -- functions are hooked to autocmd with event 'FileType' with nvim_create_autocmd() so
    -- server is only started when correct file types are open. These functions take
    -- config argument which should be superset of vim.lsp.ClientConfig

    --print("going")
    --for k,v in pairs(lspconfig.server_aliases()) do
    -- print(k, v)
    --end

    -- TODO:
    -- run setup for each language sever so wedon't have to call it here manually if there is no extraconfiguration
    -- see http://www.lazyvim.org/plugins/lsp
    -- see :h mason-lspconfig
    -- TODO:
    -- Setup ghost text so it shows arguments while writng a function?
    -- TODO:
    -- setup lsps to provide inlay_hints

    -- Configure lua-language-server. Source: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
    lspconfig.lua_ls.setup {
      -- @param client vim.lsp.Client
      on_init = function(client)
	-- Lookup workspace folders for .luarc.json config file, if it exists return
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
            return
          end
        end

	-- config: vim.lsp.ClientConfig - settings contains server specific settings
	-- Here we merge and overwrite Lua language server specific settings
        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- Depending on the usage, you might want to add additional paths here.
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        })
      end,
      settings = {
        Lua = {}
      }
    }

    -- Configure C/C++ language sever
    lspconfig.clangd.setup {}

    -- Configure gdscript language server
    lspconfig.gdscript.setup {}

    -- Configure rust language server
    lspconfig.rust_analyzer.setup {}

    lspconfig.pyright.setup {}
  end
}

