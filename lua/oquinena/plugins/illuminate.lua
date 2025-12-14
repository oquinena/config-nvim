return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    providers = {
      "lsp",
      "treesitter",
      "regex",
    },
    delay = 200,
    filetypes_denylist = {
      "dirbuf",
      "dirvish",
      "fugitive",
      "alpha",
      "NvimTree",
      "lazy",
      "neogitstatus",
      "Trouble",
      "lir",
      "Outline",
      "spectre_panel",
      "toggleterm",
      "DressingSelect",
      "TelescopePrompt",
    },
    under_cursor = true,
    large_file_cutoff = 2000,
    large_file_overrides = {
      providers = { "lsp" },
    },
    min_count_to_highlight = 1,
  },
  config = function(_, opts)
    require("illuminate").configure(opts)

    -- Keybindings to navigate between references
    local function map(key, dir, buffer)
      vim.keymap.set("n", key, function()
        require("illuminate")["goto_" .. dir .. "_reference"](false)
      end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
    end

    map("]]", "next")
    map("[[", "prev")

    -- Change highlight style (uses default highlighting groups)
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
  end,
}
