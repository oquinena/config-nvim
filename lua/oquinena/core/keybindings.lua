vim.g.mapleader = " "

local keymap = vim.keymap

-- Shortcuts
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save current file" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit neovim" })

-- Colemak-dh up/down/right/left with neim
keymap.set({ "n", "x", "v" }, "n", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set({ "n", "x", "v" }, "e", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set({ "n", "x", "v" }, "i", "'l'", { expr = true, silent = true })
keymap.set({ "n", "x", "v" }, "m", "'h'", { expr = true, silent = true })
keymap.set({ "n", "x", "v", "i" }, "<C-w>n", "<C-w>j", { desc = "Goto the down window" })
keymap.set({ "n", "x", "v", "i" }, "<C-w>e", "<C-w>k", { desc = "Goto the up window" })
keymap.set({ "n", "x", "v", "i" }, "<C-w>m", "<C-w>h", { desc = "Goto the left window" })
keymap.set({ "n", "x", "v", "i" }, "<C-w>i", "<C-w>l", { desc = "Goto the right window" })


-- Colemak-dh enter insert mode with l and L
keymap.set({ "n", "v" }, "l", "'i'", { expr = true, silent = true })
keymap.set({ "n", "v" }, "L", "'I'", { expr = true, silent = true })

-- Colemak-dh end of word with f and F
keymap.set({ "n", "v" }, "f", "'e'", { expr = true, silent = true })
keymap.set({ "n", "v" }, "F", "'E'", { expr = true, silent = true })

-- Exit into normal mode with nh
keymap.set({ "i", "c" }, "nh", "<Esc>", { silent = true })

-- Lazy
keymap.set("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "Open Lazy plugin manager" }) --  move current buffer to new tab

-- splits management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sc", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<A-i>", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<A-m>", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- toggles
keymap.set("n", "<leader>Tg", "<cmd>GitBlameToggle<CR>", { desc = "Toggle git blame info" })
