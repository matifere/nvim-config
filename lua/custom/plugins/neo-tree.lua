return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- Iconos de carpetas/archivos
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      window = {
        position = 'left', -- La barra aparecerá a la izquierda
        width = 30, -- Ancho de la barra
      },
      filesystem = {
        filtered_items = {
          visible = true, -- Mostrar archivos ocultos (como .gitignore)
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true, -- Si cambias de archivo, el árbol te sigue
        },
      },
    }

    -- Atajo para abrir/cerrar el árbol con Espacio + e
    vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle Explorer' })
  end,
}
