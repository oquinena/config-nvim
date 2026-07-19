return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- only replacing dressing.nvim: nicer vim.ui.input and vim.ui.select
    input = { enabled = true },
    picker = { enabled = true, ui_select = true },
  },
}
