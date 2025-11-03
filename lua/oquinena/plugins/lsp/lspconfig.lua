return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- your LspAttach keymaps + signs stay as-is ...

    -- define per-server config (native 0.11+ API)
    vim.lsp.config("pyright", {
      capabilities = capabilities,
      settings = { python = { analysis = { typeCheckingMode = "basic" } } },
    })

    -- mason + mason-lspconfig (no handlers anymore)
    require("mason").setup()
    require("mason-lspconfig").setup({
      -- auto :LspEnable for installed servers using your vim.lsp.config() settings
      automatic_enable = true,
    })

    -- If you don't want automatic_enable, disable it and explicitly enable:
    -- vim.lsp.enable("pyright")
  end,
}
