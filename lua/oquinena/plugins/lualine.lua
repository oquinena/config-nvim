return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "SmiteshP/nvim-navic" },
  config = function()
    local lualine = require("lualine")
    local navic = require("nvim-navic")

    -- configure lualine with auto theme and lazy update indicator
    lualine.setup({
      options = {
        theme = "auto",
      },
      sections = {
        lualine_c = {
          { "filename" },
          {
            function()
              return navic.get_location()
            end,
            cond = function()
              return navic.is_available()
            end,
          },
        },
        lualine_x = {
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
