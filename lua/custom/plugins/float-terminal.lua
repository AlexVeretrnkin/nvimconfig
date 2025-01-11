--- Відкриває плаваюче вікно з терміналом.
local function open_floating_terminal()
  -- 1. Створюємо буфер (scratch)
  local buf = vim.api.nvim_create_buf(false, true)

  -- 2. Розраховуємо позицію і розміри
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local opts = {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded', -- наприклад
  }

  -- 3. Відкриваємо плаваюче вікно
  local win = vim.api.nvim_open_win(buf, true, opts)

  -- 4. Запускаємо термінал
  vim.fn.termopen('zsh', {
    on_exit = function(_, code, _)
      -- Якщо процес закінчується з кодом 0, закриваємо вікно
      if code == 0 then
        vim.api.nvim_win_close(win, true)
      end
    end,
  })

  -- Вмикаємо режим вставки, щоб одразу можна було вводити команди
  vim.cmd 'startinsert'
end

-- Створимо команду :FloatingTerminal
vim.api.nvim_create_user_command('FloatingTerminal', function()
  open_floating_terminal()
end, { nargs = 0 })

-- (За бажанням) можна додати автокоманди або гарячі клавіші
-- Наприклад, гаряча клавіша <leader>ft
vim.keymap.set('n', '<leader>Tf', open_floating_terminal, { desc = '[T]erminal [f]loating', noremap = true, silent = true })

return {}
