return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = true,
      theme = 'onedark',
      component_separators = '|',
      section_separators = '',
    },
    tabline = { lualine_a = {}, lualine_b = { 'branch' }, lualine_c = { 'filename' }, lualine_x = {}, lualine_y = {}, lualine_z = {} },
  },
}
