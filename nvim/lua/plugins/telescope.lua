-- Fuzzy Finder (files, lsp, etc)
return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' },
  config = function()
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {

      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
        file_ignore_patterns = { "^./node_modules/", 'node_modules/.*', "^./.nuxt/", '.nuxt/.*', "^./.output/",
          '.output/.*' },
      },
    }
    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')
    require('plugins.mappings.telescope')
    require("telescope").load_extension "file_browser"
    require('telescope').load_extension('luasnip')
  end,
  -- keys = function()
  --   local builtin = require("telescope.builtin")
  --   return {
  --       {
  --           "<leader>sf",
  --           function()
  --               builtin.find_files()
  --           end
  --       },
  --   }
  -- end
}
