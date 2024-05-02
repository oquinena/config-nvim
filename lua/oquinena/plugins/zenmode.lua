return {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup {
      window = {
        width = 0.85,
        height = 0.85,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        },
      },
    }
  end,
}
