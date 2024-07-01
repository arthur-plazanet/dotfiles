-- require'telescope'.extensions.luasnip.luasnip{}
vim.keymap.set('n', '<leader>ps', function() vim.cmd [[ Telescope luasnip ]] end, { noremap = true, silent = true })
