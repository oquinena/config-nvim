local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces

opt.wrap = true
opt.linebreak = true

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

opt.scrolloff = 8 -- keep context visible above/below the cursor

-- briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
-- 'background' is deliberately not set here: dark_notify (see
-- plugins/colorscheme.lua) sets it from the macOS appearance at startup and
-- on every light/dark switch. Forcing it here would fight that.
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- font settings (for GUI clients like Neovide, GVim, etc.)
opt.guifont = "Fira Code:h14"

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- persistent undo across sessions (stored in ~/.local/state/nvim/undo)
opt.undofile = true

-- detect ansible files so ansiblels attaches (it only handles ft=yaml.ansible)
vim.filetype.add({
  -- docker_compose_language_service only handles ft=yaml.docker-compose
  filename = {
    ["docker-compose.yml"] = "yaml.docker-compose",
    ["docker-compose.yaml"] = "yaml.docker-compose",
    ["compose.yml"] = "yaml.docker-compose",
    ["compose.yaml"] = "yaml.docker-compose",
  },
  pattern = {
    [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
    [".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
    [".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
    [".*playbook%.ya?ml"] = "yaml.ansible",
    [".*/site%.ya?ml"] = "yaml.ansible",
  },
})
