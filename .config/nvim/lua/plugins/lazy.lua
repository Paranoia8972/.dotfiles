require('lazy').setup({
    {
        'folke/lazy.nvim',
        lazy = true,
    },
    {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require('plugins.filemanager')
        end
    },
    {
        'glepnir/dashboard-nvim',
        config = function()
            require('plugins.dashboard')
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            require('plugins.lsp')
        end
    },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            require('plugins.autocompletion')
        end
    },
    {
        'junegunn/fzf',
        config = function()
            require('plugins.fzf')
        end
    },
    { 
        'olivercederborg/poimandres.nvim',
        lazy = false,
        priority = 1000,
        config = function()
          require('poimandres').setup {
          }
        end
    },
    {
        'andweeb/presence.nvim',
        config = function()
            require('plugins.discord')
        end
    },
    {
        'github/copilot.vim',
    },
    {
        'hrsh7th/cmp-nvim-lsp',
    },
    {
        'hrsh7th/cmp-buffer',
    },
    {
        'hrsh7th/cmp-path',
    },
    {
        'hrsh7th/cmp-cmdline',
    },
    {
        'saadparwaiz1/cmp_luasnip',
    },
    {
        'L3MON4D3/LuaSnip',
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'gruvbox-community/gruvbox'
        }
    },
})