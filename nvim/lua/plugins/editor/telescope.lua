-- Fuzzy Finder (files, lsp, etc)
local telescope = {
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
    pcall(require('telescope').load_extension('fzf'))
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
      { "<leader>?",  builtin.oldfiles,    desc = "Search in Recently Opened Files" },
      -- { "<leader>ss", ':Telescope luasnip<CR>', desc = "Search Snippets" },
    })
  end
}

-- Telescope extensions

-- https://github.com/nvim-telescope/telescope-symbols.nvim
-- Emoji Picker for Telescope.nvim
local telescope_symbols = {
  'nvim-telescope/telescope-symbols.nvim',
  keys = {
    { '<leader>se', ':Telescope symbols<CR>', desc = "Search Emojis", mode = 'n' },
  },
}

-- Show and search luasnip snippets in telescope
local telescope_luasnip = {
  'benfowler/telescope-luasnip.nvim',
  keys = {
    { '<leader>ss', ':Telescope luasnip<CR>', desc = "Search Snippets", mode = 'n' },
  },
}

-- https://github.com/nvim-telescope/telescope-file-browser.nvim?tab=readme-ov-file
local telescope_file_browser = {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  keys = {
    { '<leader>fb', ':Telescope file_browser<CR>', desc = "File Browser", mode = 'n' },
  },
}

-- Fuzzy Finder Algorithm which requires local dependencies to be built.
-- Only load if `make` is available. Make sure you have the system
-- requirements installed.
local telescope_fzf_native = {
  'nvim-telescope/telescope-fzf-native.nvim',
  -- NOTE: If you are having trouble with this installation,
  --       refer to the README for telescope-fzf-native for more instructions.
  build = 'make',
  cond = function()
    return vim.fn.executable 'make' == 1
  end,
}

-- TODO: To test
local telescope_project = {
  'nvim-telescope/telescope-project.nvim',
  -- enabled = false,
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  keys = {
    { '<leader>fp', ':Telescope project<CR>', desc = "Find Projects", mode = 'n' },
  },
}


return {
  telescope,
  telescope_symbols,
  telescope_luasnip,
  telescope_file_browser,
  telescope_fzf_native,
  telescope_project,
}
