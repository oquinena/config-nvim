return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup({
      -- Disable go.nvim's LSP config (we use our own gopls config)
      lsp_cfg = false,
      lsp_keymaps = false,

      -- Disable inlay hints (managed through LSP directly)
      lsp_inlay_hints = {
        enable = false,
      },

      -- Test settings
      run_in_floaterm = true,

      -- Formatter
      formatter = "gofumpt",

      -- Icons
      icons = { breakpoint = "🔴", currentpos = "🔶" },
    })

    -- Set up keybindings
    local opts = { noremap = true, silent = true }

    -- Go-specific keybindings with which-key descriptions
    vim.keymap.set("n", "<leader>gat", "<cmd>GoAddTag<cr>",
      vim.tbl_extend("force", opts, { desc = "Add struct tags" }))
    vim.keymap.set("n", "<leader>grt", "<cmd>GoRmTag<cr>",
      vim.tbl_extend("force", opts, { desc = "Remove struct tags" }))
    vim.keymap.set("n", "<leader>gtf", "<cmd>GoTestFile<cr>",
      vim.tbl_extend("force", opts, { desc = "Test file" }))
    vim.keymap.set("n", "<leader>gtp", "<cmd>GoTestPkg<cr>",
      vim.tbl_extend("force", opts, { desc = "Test package" }))
    vim.keymap.set("n", "<leader>gie", "<cmd>GoIfErr<cr>",
      vim.tbl_extend("force", opts, { desc = "Add if err" }))
    vim.keymap.set("n", "<leader>gfs", "<cmd>GoFillStruct<cr>",
      vim.tbl_extend("force", opts, { desc = "Fill struct" }))
    vim.keymap.set("n", "<leader>gim", "<cmd>GoImpl<cr>",
      vim.tbl_extend("force", opts, { desc = "Implement interface" }))
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
}
