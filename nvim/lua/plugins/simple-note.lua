return {
  'rguruprakash/simple-note.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local simple_note = require('simple-note')
    simple_note.setup({
      -- Optional Configurations
      notes_dir = '~/notes/', -- default: '~/notes/'
      notes_directories = {   -- default: {}
        '~/notes/',
      },
      telescope_new = '<C-n>',              -- default: <C-n>
      telescope_delete = '<C-x>',           -- default: <C-x>
      telescope_rename = '<C-r>',           -- default: <C-r>
      telescope_change_directory = '<C-c>', -- default: <C-c>


    })
    local wk = require('which-key')

    wk.add {
      { '<leader>n',  group = 'Simple Note' },
      { '<leader>n',  ':SimpleNoteList<CR>',   desc = '[Simple Note] Show note list' },
      { '<leader>nc', ':SimpleNoteCreate<CR>', desc = '[Simple Note] Create new note' },
    }
  end
}
