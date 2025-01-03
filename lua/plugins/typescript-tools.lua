return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {},
  config = function()
    local typescript_tools = require 'typescript-tools'

    typescript_tools.setup {}

    vim.keymap.set('n', '<leader>ru', function()
      require('typescript-tools.api').remove_unused_imports()
    end, { desc = '[R]emove [u]nused imports' })

    vim.keymap.set('n', '<leader>rf', function()
      require('typescript-tools.api').fix_all(false)
    end, { desc = '[F]ix all' })
  end,
}
