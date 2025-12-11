return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = { enabled = false }, -- Disable panel, use ghost text only
      suggestion = {
        enabled = true,
        auto_trigger = true, -- Show suggestions immediately in insert mode
        debounce = 75,
        keymap = {
          accept = "<Tab>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>", -- Alt+] for next suggestion
          prev = "<M-[>", -- Alt+[ for previous suggestion
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        yaml = true,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
    })
  end,
}
