vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- vim.opt.wrap = false

vim.opt.clipboard = "unnamedplus"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.guifont = "JetBrainsMono Nerd Font:h11"

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- neovide settings
vim.g.neovide_scale_factor = 1.0
vim.g.neovide_refresh_rate = 60
vim.g.neovide_refresh_rate_idle = 5
-- vim.g.neovide_fullscreen = true
vim.g.neovide_cursor_antialiasing = true

vim.g.copilot_filetypes = { yaml = true, yml = true, md = false, vimwiki = false }

-- vim.opt.colorcolumn = "80"
