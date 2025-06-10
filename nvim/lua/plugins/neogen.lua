local M = {
  'danymat/neogen',
  config = true,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
  enabled = true,
}

function M.config()
  local wk = require 'which-key'
  local neogen = require 'neogen'
  wk.add {
    { '<leader>doc', ':Neogen<CR>', desc = 'Annotations Generate' },
  }
end

return M
