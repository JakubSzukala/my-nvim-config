return {
  "neovim/nvim-lspconfig",
  events = { "BufEnter" },
  dependencies = {
    "mason.nvim",
    { "williamboman/mason-lspconfig.nvim" },
  },
}

