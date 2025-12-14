local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "oquinena.plugins" }, { import = "oquinena.plugins.lsp" } }, {
  checker = {
    enabled = true,
    notify = false,
    frequency = 86400, -- check for updates once a day (in seconds)
  },
  change_detection = {
    notify = false,
  },
})

-- Auto-update plugins once a day in the background
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyCheck",
  callback = function()
    require("lazy").sync({ wait = false, show = false })
  end,
})
