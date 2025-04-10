return {
  'prettier/vim-prettier',
  event = 'VeryLazy',
  config = function()
    local prettier_filetypes = {
      'javascript',
      'typescript',
      'javascriptreact',
      'typescriptreact',
      'css',
      'scss',
      'json',
      'yaml',
      'markdown',
      'js',
      'ts',
      -- без html тут, бо для нього буде окремо
    }

    vim.api.nvim_create_augroup('PrettierMixedFormat', { clear = true })

    -- HTML: кастомна shell команда (пряма заміна буфера)
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = 'PrettierMixedFormat',
      pattern = '*.html',
      callback = function()
        local pos = vim.api.nvim_win_get_cursor(0)
        local filepath = vim.fn.expand '%:p'
        local cmd = string.format('silent! %%!npx prettier --write --stdin-filepath %s', filepath)
        vim.cmd(cmd)
        pcall(function()
          vim.api.nvim_win_set_cursor(0, pos)
        end)
      end,
    })

    -- Інші типи — використовуємо PrettierAsync (vim-prettier)
    for _, ft in ipairs(prettier_filetypes) do
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = 'PrettierMixedFormat',
        pattern = '*.' .. ft,
        callback = function()
          -- курсор збережеться автоматично, бо PrettierAsync не перезавантажує буфер напряму
          vim.cmd 'silent! PrettierAsync'
        end,
      })
    end
  end,
}
