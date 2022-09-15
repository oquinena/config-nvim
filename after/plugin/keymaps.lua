local g = vim.g
local api = vim.api
local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

-- Space as leader key
keymap("", "<Space>", "<Nop>", default_opts)
g.mapleader = " "
g.maplocalleader = ","

-- Word wrap
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- jk to ESC
keymap("i", "jk", "<ESC>", default_opts)

-- Switch buffer
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", default_opts)
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", default_opts)

-- NvimTreeToggle
keymap("n", "<S-t>", ":NvimTreeToggle<CR>", default_opts)

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP', default_opts)

local keys = {
  ['cr']        = vim.api.nvim_replace_termcodes('<CR>', true, true, true),
  ['ctrl-y']    = vim.api.nvim_replace_termcodes('<C-y>', true, true, true),
  ['ctrl-y_cr'] = vim.api.nvim_replace_termcodes('<C-y><CR>', true, true, true),
}

_G.cr_action = function()
  if vim.fn.pumvisible() ~= 0 then
    -- If popup is visible, confirm selected item or add new line otherwise
    local item_selected = vim.fn.complete_info()['selected'] ~= -1
    return item_selected and keys['ctrl-y'] or keys['ctrl-y_cr']
  else
    -- If popup is not visible, use plain `<CR>`. You might want to customize
    -- according to other plugins. For example, to use 'mini.pairs', replace
    -- next line with `return require('mini.pairs').cr()`
    return keys['cr']
  end
end

api.nvim_set_keymap('i', '<CR>', 'v:lua._G.cr_action()', { noremap = true, expr = true })
