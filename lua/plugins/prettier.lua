return {
  'prettier/vim-prettier',
  event = 'VeryLazy',
  config = function()
    -- Вимикаємо автозапуск форматування, бо це робитиме conform.nvim
    vim.g['prettier#autoformat'] = 0
    vim.g['prettier#quickfix_enabled'] = 0
  end,
}
