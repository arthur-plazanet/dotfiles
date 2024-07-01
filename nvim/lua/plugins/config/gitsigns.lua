local gitsigns = require 'gitsigns'

local function my_mapping(bufnr)
  vim.keymap.set('n', '<leader>gp', gitsigns.prev_hunk, { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
  vim.keymap.set('n', '<leader>gn', gitsigns.next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
  vim.keymap.set('n', '<leader>ph', gitsigns.preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
  vim.keymap.set('n', '<leader>gb', gitsigns.toggle_current_line_blame, { buffer = bufnr, desc = '[T]oggle [B]lame' })
  vim.keymap.set('n', '<leader>hd', gitsigns.diffthis, { buffer = bufnr, desc = '[H]ighlight [D]iff' })
end

gitsigns.setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
  on_attach = my_mapping
}
