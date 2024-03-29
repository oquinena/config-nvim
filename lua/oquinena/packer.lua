-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    use({
        "j-morano/buffer_manager.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use({
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    })
    use({
        "christoomey/vim-tmux-navigator",
    })

    -- THEMES
    -- use({
    --     "folke/tokyonight.nvim",
    --     config = function()
    --         vim.cmd("colorscheme tokyonight")
    --     end,
    -- })
    use({
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            vim.cmd("colorscheme catppuccin-mocha")
        end,
    })
    -- use({
    --     "bluz71/vim-nightfly-colors",
    --     as = "nightfly",
    --     config = function()
    --         vim.cmd("colorscheme nightfly")
    --     end,
    -- })

    -- show indent lines
    use("lukas-reineke/indent-blankline.nvim")

    -- vimwiki
    use("vimwiki/vimwiki")

    -- folding
    -- use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

    use({
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
    })

    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("nvim-treesitter/playground")
    use("theprimeagen/harpoon")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use({
        "jay-babu/mason-null-ls.nvim",
        requires = {
            { "williamboman/mason.nvim" },
            { "jose-elias-alvarez/null-ls.nvim" },
        },
    })

    use({
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
    })

    use("github/copilot.vim")
    -- use { 'codota/tabnine-nvim', run = "./dl_binaries.sh" }
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })
    use({
        "mhartington/formatter.nvim",
    })
    use({ "mtdl9/vim-log-highlighting", ft = "log" })
    use({
        "m4xshen/autoclose.nvim",
        config = function()
            require("autoclose").setup({
                disabled_filetypes = { "Text", "markdown" },
            })
        end,
    })
end)
