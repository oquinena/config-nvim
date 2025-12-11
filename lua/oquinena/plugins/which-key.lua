return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    wk.setup({
      delay = 500,
    })

    -- Register keymap groups for documentation
    wk.add({
      { "<leader>c", group = "Code" },
      { "<leader>d", group = "Diagnostics" },
      { "<leader>f", group = "Find/File" },
      { "<leader>g", group = "Go" },
      { "<leader>ga", group = "Add (tags)" },
      { "<leader>gr", group = "Remove (tags)" },
      { "<leader>gt", group = "Test" },
      { "<leader>gi", group = "Insert/Impl" },
      { "<leader>gf", group = "Fill" },
      { "<leader>h", group = "Git Hunk" },
      { "<leader>l", group = "Lint" },
      { "<leader>m", group = "Format" },
      { "<leader>r", group = "Rename/Restart" },
      { "<leader>s", group = "Split" },
      { "<leader>t", group = "Tab/Toggle" },
      { "<leader>th", desc = "Toggle inlay hints" },
      { "<leader>tb", desc = "Toggle git blame" },
      { "<leader>td", desc = "Toggle deleted" },
      { "<leader>x", group = "Trouble/Diagnostics" },
      { "<leader>e", desc = "Toggle file explorer" },
      { "<leader>w", desc = "Save file" },
      { "<leader>q", desc = "Quit" },
      { "]c", desc = "Next git hunk" },
      { "[c", desc = "Previous git hunk" },
    })
  end,
}
