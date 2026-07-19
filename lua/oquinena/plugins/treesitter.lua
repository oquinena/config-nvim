return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    { "windwp/nvim-ts-autotag", opts = {} },
  },
  config = function()
    -- the main branch dropped setup({ ensure_installed }); parsers are
    -- installed with install() and highlighting is started per buffer
    require("nvim-treesitter").install({
      "json",
      "yaml",
      "html",
      "css",
      "markdown",
      "markdown_inline",
      "go",
      "gomod",
      "javascript",
      "typescript",
      "tsx",
      "bash",
      "lua",
      "vim",
      "dockerfile",
      "gitignore",
      "query",
      "vimdoc",
      "terraform",
      "python",
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter_highlight", { clear = true }),
      callback = function(ev)
        pcall(vim.treesitter.start, ev.buf)
      end,
    })
  end,
}
