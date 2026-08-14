return {
  'kdheepak/lazygit.nvim',
  lazy = true,
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  -- Dependencia necesaria para que funcione la ventana flotante
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  -- Configuración de teclas (Atajo)
  keys = {
    { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'Abrir LazyGit' },
  },
}
