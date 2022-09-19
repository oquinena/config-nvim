local opt = vim.opt
local g = vim.g

opt.breakindent = true
opt.clipboard = "unnamedplus"
opt.hidden = true
opt.hlsearch = false
opt.ignorecase = true
opt.laststatus = 3
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.undofile = true
opt.updatetime = 250
opt.laststatus = 3
opt.cmdheight = 0

opt.path:remove("/usr/include")
opt.path:append("**")
opt.wildignorecase = true
opt.wildignore:append("**/node_modules/*")
opt.wildignore:append("**/.git/*")

opt.guifont = { "JetBrainsMono NF", ":h8" }

if g.neovide then
  g.neovide_transparency = 1.0
  g.neovide_fullscreen = false
end
