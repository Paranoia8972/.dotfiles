return {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
  
      lspconfig.ts_ls.setup{
        on_attach = function(client, bufnr) end,
        capabilities = {},
      }
  
      lspconfig.gopls.setup{
        on_attach = function(client, bufnr) end,
        capabilities = {},
      }
  
      lspconfig.rust_analyzer.setup{
        on_attach = function(client, bufnr) end,
        capabilities = {},
      }
  
      lspconfig.tailwindcss.setup{
        on_attach = function(client, bufnr) end,
        capabilities = {},
      }
    end,
  }