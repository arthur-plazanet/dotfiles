local ibl = require "ibl"

vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"

ibl.setup {
  indent                         = {
    char = '┊',
  },
  -- show_trailing_blankline_indent = true,
  -- show_first_indent_level        = true,
  -- listchars                      = {
  --   space = ' ',
  --   -- eol = '↴',
  -- },
}
