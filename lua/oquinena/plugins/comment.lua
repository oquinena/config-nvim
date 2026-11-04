-- Commenting itself is native (gc/gcc). This plugin only supplies the right
-- commentstring inside JSX/TSX, which native gc gets wrong ("//" not "{/* */}").
return {
  "JoosepAlviste/nvim-ts-context-commentstring",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("ts_context_commentstring").setup({ enable_autocmd = false })

    local get_option = vim.filetype.get_option
    vim.filetype.get_option = function(filetype, option)
      return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
        or get_option(filetype, option)
    end

    -- explicit toggle mappings on top of the default gcc/gc
    vim.keymap.set("n", "<leader>gg", "gcc", { remap = true, desc = "Toggle comment line" })
    vim.keymap.set("x", "<leader>gg", "gc", { remap = true, desc = "Toggle comment selection" })
  end,
}
