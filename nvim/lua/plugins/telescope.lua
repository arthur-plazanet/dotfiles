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
      pickers = {
        find_files = {
          theme = "dropdown",
        }
      },
    }
    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')
    require("telescope").load_extension "file_browser"
    require('telescope').load_extension('luasnip')
    local builtin = require('telescope.builtin')
    local nmap = require('utils').nmap
    -- See `:help telescope.builtin`
    -- nmap('<leader>?', builtin.oldfiles, '[?] Find recently opened files')
    -- vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
    nmap('<leader><space>', builtin.buffers, '[ ] Find existing buffers')
    nmap('<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, '[/] Fuzzily search in current buffer')
    -- local nmap = require('utils').nmap

    -- nmap('<leader>sf', builtin.find_files, '[S]earch [F]iles')
    -- nmap('<leader>sh', builtin.help_tags, '[S]earch [H]elp')
    -- nmap('<leader>sw', builtin.grep_string, '[S]earch current [W]ord')
    -- nmap('<leader>sg', builtin.live_grep, '[S]earch by [G]rep')
    -- nmap('<leader>sd', builtin.diagnostics, '[S]earch [D]iagnostics')
  end,
  keys = function()
    local builtin = require("telescope.builtin")
    local wk = require("which-key")
    wk.add({
      { '<leader>s',  group = "telescope" },
      { "<leader>sf", builtin.find_files,  desc = "Search Files" },
      { "<leader>sh", builtin.help_tags,   desc = "Search Help" },
      { "<leader>sw", builtin.grep_string, desc = "Search Current Word" },
      { "<leader>sg", builtin.live_grep,   desc = "Search by Grep" },
      { "<leader>sd", builtin.diagnostics, desc = "Search Diagnostics" },
      { "<leader>sb", builtin.builtin,     desc = "Search Builtins" },
      { "<leader>?",  builtin.oldfiles,    desc = "Find Recently Opened Files" },
    })
  end
}
