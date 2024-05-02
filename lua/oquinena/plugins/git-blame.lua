return {
  'f-person/git-blame.nvim',
  config = function()
    require('gitblame').setup({
      enabled = false,
      date_format = "%Y-%m-%d %A %H:%M",
    })
  end,
}
