-- TODO: Improve config

return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  -- -@module "ibl"
  -- -@type ibl.config
  opts = {
    indent = {
      char = '·',
      -- tab_char = { 'a', 'b', 'c' },
      -- highlight = { 'Function', 'Label' },
      -- highlight = { 'Label' },
      highlight = 'NonText',
      smart_indent_cap = true,
      priority = 2,
      repeat_linebreak = false,
    },
    scope = { enabled = false },
  },
}
