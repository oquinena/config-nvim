require("telescope").setup {
  extensions = {
    file_browser = {
      -- theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      initial_mode = "normal",
      hijack_netrw = true,
      mappings = {
        ["n"] = {
          -- your custom normal mode mappings
        },
        ["i"] = {
          -- your custom insert mode mappings
        },
      },
    },
  },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"
