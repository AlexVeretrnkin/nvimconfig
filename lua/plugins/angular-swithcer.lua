-- Приклад функції для перемикання між .component.ts та .component.html
local function toggle_angular_file()
  -- Отримуємо повний шлях до поточного файлу
  local filename = vim.fn.expand '%:p'

  -- Якщо файл - .component.ts, міняємо на .component.html
  if filename:match '%.component%.ts$' then
    local newfile = filename:gsub('%.component%.ts$', '.component.html')
    vim.cmd('edit ' .. newfile)

  -- Якщо файл - .component.html, міняємо на .component.ts
  elseif filename:match '%.component%.html$' then
    local newfile = filename:gsub('%.component%.html$', '.component.ts')
    vim.cmd('edit ' .. newfile)
  else
    print "It's not an Angular component (not .component.ts nor .component.html)!"
  end
end

-- Створимо команду, щоб викликати нашу функцію в Neovim
vim.api.nvim_create_user_command(
  'ToggleAngular', -- назва команди
  toggle_angular_file,
  {}
)

-- [ОПЦІЙНО] Призначимо гарячу клавішу (наприклад, <leader>a)
vim.keymap.set('n', '<leader>a', toggle_angular_file, { desc = 'Toggle between .component.ts and .component.html' })
