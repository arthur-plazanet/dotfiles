-- https://github.com/nvim-treesitter/nvim-treesitter/issues/3232#issuecomment-1198882715
-- Issue in droplet that uses wget by default (therefore permission issues)
require("nvim-treesitter.install").prefer_git = true

local treesitter = require 'nvim-treesitter.configs'

treesitter.setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'lua', 'typescript', 'vimdoc', 'vim', 'javascript', 'html', 'css', 'json', 'yaml', 'dockerfile',
    'scss', 'vue' },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  -- TODO: TO VERIFY
  auto_install = true,
  -- List of parsers to ignore installing (or "all")
  ignore_install = {},
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}
