local render = require 'render-markdown'

vim.keymap.set('n', '<leader>mr', render.buf_toggle,
  { desc = '[render-markdown] Toggle state of this plugin for current buffer' })

render.setup({
  file_types = { 'markdown', 'quarto' },
})
