vim.g.mapleader = " "

local keymap = vim.keymap

-- Shortcuts
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save current file" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit neovim" })

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
