-- Archivo: lua/custom/plugins/treesitter.lua
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'typescript',
      'javascript',
      'json',
      'html',
      'css',
      'bash',
      'lua',
      'vim',
      'dockerfile', -- Útil si dockerizas tu app Nest
      'jsdoc', -- Para documentación
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
