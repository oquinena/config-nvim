-- Follows the macOS appearance along with the rest of the stack: kitty
-- (light-theme.auto.conf / dark-theme.auto.conf), tmux (tmux-dark-notify
-- sources ~/.tmux/theme-{rose-pine-dawn,nord}.conf),
-- starship (the `palette =` line, rewritten by the switcher agent) and Claude
-- Code (`"theme": "auto"`).
--
-- Rose Pine Dawn in light, Nord in dark. dark_notify sets
-- vim.o.background and loads the matching colorscheme when macOS flips, so
-- the switch is live with no restart.
return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "dawn",
        styles = { italic = true },
      })
    end,
  },

  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nord").setup({})
    end,
  },

  {
    -- Watches the macOS appearance, sets vim.o.background and loads the
    -- scheme below. Needs the dark-notify binary:
    -- brew install cormacrelf/tap/dark-notify
    "cormacrelf/dark-notify",
    lazy = false,
    priority = 999, -- after both colorschemes are set up
    config = function()
      require("dark_notify").run({
        schemes = { light = "rose-pine", dark = "nord" },
      })
    end,
  },
}
