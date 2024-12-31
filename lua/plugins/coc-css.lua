return {
  'neoclide/coc.nvim',
  branch = 'release',
  config = function()
    vim.g.coc_global_extensions = {
      'coc-html',
      'coc-css',
      'coc-tsserver',
    }

    -- Автодоповнення по Ctrl + Space
    vim.api.nvim_set_keymap('i', '<C-a>', 'coc#refresh()', { noremap = true, silent = true, expr = true })

    -- Вибір автодоповнення через Enter
    vim.api.nvim_set_keymap('i', '<CR>', [[pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], { noremap = true, expr = true })

    -- Показ підказок при наведенні
    vim.api.nvim_set_keymap('n', 'K', ":call CocAction('doHover')<CR>", { noremap = true, silent = true })

    -- Перехід до визначення класу (Ctrl+d)
    vim.api.nvim_set_keymap('n', '<C-d>', '<Plug>(coc-definition)', { noremap = false })
  end,
}
