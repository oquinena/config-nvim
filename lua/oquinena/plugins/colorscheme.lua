return {
  -- "catppuccin/nvim",
  -- "gbprod/nord.nvim",
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000,

  config = function()
    require("everforest").setup({
      background = "soft",
      transparent_background_level = 0,
      italics = true,
      disable_italic_comments = false,
      inlay_hints_background = "dimmed",
      on_highlights = function(hl, palette)
        hl["@string.special.symbol.ruby"] = { link = "@field" }
        hl["DiagnosticUnderlineWarn"] = { undercurl = true, sp = palette.yellow }
      end,
    })
    vim.opt.background = "dark"
    vim.cmd("colorscheme everforest")
  end
}
