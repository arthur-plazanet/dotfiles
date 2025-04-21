return {
  'barrett-ruth/live-server.nvim',
  build = 'npm install -g live-server',
  cmd = { 'LiveServerStart', 'LiveServerStop' },
  config = true,
  keys = {
    { '<leader>ls', ':LiveServerStart<Enter>', desc = 'Start Live Server' },
    { '<leader>lq', ':LiveServerStop<Enter>',  desc = 'Stop Live Server' },
  },
}
