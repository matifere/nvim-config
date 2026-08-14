return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {
    check_ts = true, -- Habilita integración con Treesitter (genial para JS/TS)
  },
  -- Con 'opts', lazy automáticamente llama a require('nvim-autopairs').setup(opts)
}
