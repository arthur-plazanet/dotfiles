local keymap = vim.keymap

keymap.set('t', '<Esc>', [[<C-\><C-n>]])
keymap.set('n', '<leader>dd', ':DiffviewOpen<Enter>')

-- File Explorer
keymap.set('n', '<C-x>', ':NvimTreeFocus<CR>')
keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>')

-- Resize window using <ctrl> arrow keys
keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

keymap.set("n", "<C-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<C-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<C-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap.set("n", "<C-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Switch windows
keymap.set("n", "<C-S-Up>", ":wincmd k<CR>", { desc = "Move to window above" })
keymap.set("n", "<C-S-Right>", ":wincmd l<CR>", { desc = "Move to window right" })
keymap.set("n", "<C-S-Down>", ":wincmd j<CR>", { desc = "Move to window below" })
keymap.set("n", "<C-S-Left>", ":wincmd h<CR>", { desc = "Move to window left" })

keymap.set("n", "<C-S-k>", ":wincmd k<CR>", { desc = "Move to window above" })
keymap.set("n", "<C-S-l>", ":wincmd l<CR>", { desc = "Move to window right" })
keymap.set("n", "<C-S-j>", ":wincmd j<CR>", { desc = "Move to window below" })
keymap.set("n", "<C-S-h>", ":wincmd h<CR>", { desc = "Move to window left" })

-- Tabs
keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "Open a new tab" })
keymap.set("n", "<leader>t<Right>", ":tabn<CR>", { desc = "Move to the next tab" })
keymap.set("n", "<leader>t<Left>", ":tabp<CR>", { desc = "Move to the previous tab" })
keymap.set("n", "<leader>tl", ":tabn<CR>", { desc = "Move to the next tab" })
keymap.set("n", "<leader>th", ":tabp<CR>", { desc = "Move to the previous tab" })
keymap.set("n", "<leader>tw", ":tabc<CR>", { desc = "Close current tab" })

-- Split windows
keymap.set("n", "<C-s>", ":sp<CR>", { desc = "Split window horizontally" })
keymap.set("n", "<C-S-s>", ":vs<CR>", { desc = "Split window vertically" })
-- keymap.set("n", "<C-h>", ":sp<CR>", { desc = "Split window horizontally" })
-- keymap.set("n", "<C-v>", ":vs<CR>", { desc = "Split window vertically" })


-- new file
-- keymap("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- keymap("n", "<leader>uf", require("lazyvim.plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
--
vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser<CR>",
  { noremap = true }
)
