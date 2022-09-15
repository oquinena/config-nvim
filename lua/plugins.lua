local D = {}

function D.setup()
  local packer_bootstrap = false -- Indicate first time installation
  -- packer.nvim configuration
  local conf = {
    profile = {
      enable = true,
      threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },

    display = {
      open_fn = function()
        return require("packer.util").float({ border = "rounded" })
      end,
    },
  }

  local function packer_init()
    -- Check if packer.nvim is installed
    local fn = vim.fn
    local cmd = vim.cmd
    local api = vim.api
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      })
      cmd([[packadd packer.nvim]])
    end

    -- Run PackerCompile if there are changes in this file
    local packerGrp = api.nvim_create_augroup("packer_user_config", { clear = true })
    api.nvim_create_autocmd(
      { "BufWritePost" },
      { pattern = "init.lua", command = "source <afile> | PackerCompile", group = packerGrp }
    )
  end

  -- Plugins
  local function plugins(use)
    use({ "wbthomason/packer.nvim" })
    use({ "kyazdani42/nvim-web-devicons" })
    use({ "nvim-lua/plenary.nvim" })

    -- Colorscheme
    use({
      "folke/tokyonight.nvim",
      config = function()
        vim.cmd "colorscheme tokyonight"
      end,
    })
    use({
      "TimUntersberger/neogit",
      cmd = { "Neogit" },
      config = function()
        require("neogit").setup({})
      end,
    })
    -- Buffer line
    use({
      "akinsho/nvim-bufferline.lua",
      event = "BufReadPre",
      wants = "nvim-web-devicons",
      config = function()
        require("config.bufferline").setup()
      end,
    })
    use({
      "echasnovski/mini.nvim",
      config = function()
        require("config.mini")
      end,
    })
    use({
      'nvim-treesitter/nvim-treesitter',
      config = function()
        require('nvim-treesitter.configs').setup({
          ensure_installed = { 'go' },
          highlight = { enable = true },
        })
      end,
      run = ':TSUpdate',
    })
    use({
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons",
      },
      cmd = { "NvimTreeToggle", "NvimTreeClose" },
      config = function()
        require("config.nvimtree").setup()
      end,
    })

    -- Completion
    use {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      opt = true,
      config = function()
        require("config.cmp").setup()
      end,
      wants = { "LuaSnip", "lspkind-nvim" },
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "ray-x/cmp-treesitter",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "lukas-reineke/cmp-rg",
        "davidsierradz/cmp-conventionalcommits",
        "onsails/lspkind-nvim",
        -- "hrsh7th/cmp-calc",
        -- "f3fora/cmp-spell",
        "hrsh7th/cmp-emoji",
        {
          "L3MON4D3/LuaSnip",
          wants = { "friendly-snippets", "vim-snippets" },
          config = function()
            require("config.snip").setup()
          end,
        },
        "rafamadriz/friendly-snippets",
        "honza/vim-snippets",
        { "tzachar/cmp-tabnine", run = "./install.sh", disable = false },
      },
    }

    -- Auto pairs
    use {
      "windwp/nvim-autopairs",
      opt = true,
      event = "InsertEnter",
      wants = "nvim-treesitter",
      module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
      config = function()
        require("config.autopairs").setup()
      end,
    }

    -- LSP
    use({
      "neovim/nvim-lspconfig",
      event = "BufReadPre",
      wants = {
        -- "nvim-lsp-installer",
        "mason.nvim",
        "mason-lspconfig.nvim",
        "mason-tool-installer.nvim",
        "cmp-nvim-lsp",
        "lua-dev.nvim",
        "vim-illuminate",
        "null-ls.nvim",
        "schemastore.nvim",
        "typescript.nvim",
        "nvim-navic",
        "inlay-hints.nvim",
        -- "goto-preview",
      },
      requires = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "folke/lua-dev.nvim",
        "RRethy/vim-illuminate",
        "jose-elias-alvarez/null-ls.nvim",
        {
          "j-hui/fidget.nvim",
          config = function()
            require("fidget").setup {}
          end,
        },
        "b0o/schemastore.nvim",
        "jose-elias-alvarez/typescript.nvim",
        {
          -- "SmiteshP/nvim-navic",
          "alpha2phi/nvim-navic",
          config = function()
            require("nvim-navic").setup {}
          end,
          module = { "nvim-navic" },
        },
        {
          "simrat39/inlay-hints.nvim",
          config = function()
            require("inlay-hints").setup()
          end,
        },
        {
          "zbirenbaum/neodim",
          event = "LspAttach",
          config = function()
            require("config.neodim").setup()
          end,
          disable = true,
        },
        {
          "L3MON4D3/LuaSnip",
          config = function()
            require("config.luasnip")
          end,
        },
      },
      config = function()
        require("config.lsp")
      end,
    })
    -- use({
    --   "ray-x/go.nvim",
    --   -- event = "BufReadPre",
    --   config = function()
    --     require("config.go").setup()
    --   end,
    -- })
    -- use({
    --   "ray-x/guihua.lua",
    -- })

    -- Bootstrap Neovim
    if packer_bootstrap then
      print("Neovim restart is required after installation!")
      require("packer").sync()
    end
  end

  -- packer.nvim
  packer_init()
  local packer = require("packer")
  packer.init(conf)
  packer.startup(plugins)
end

return D
