return {
  'prettier/vim-prettier',
  event = 'VeryLazy',
  config = function()
    vim.api.nvim_create_augroup('PrettierAutocmd', { clear = true })

    vim.api.nvim_create_autocmd('BufWritePre', {
      group = 'PrettierAutocmd',
      pattern = { '*.js', '*.ts', '*.jsx', '*.tsx', '*.json', '*.css', '*.scss', '*.html', '*.md' },
      callback = function()
        vim.cmd 'PrettierAsync'
      end,
    })
  end,
}
