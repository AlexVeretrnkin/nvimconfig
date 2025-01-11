local builtin = require 'telescope.builtin'
local telescope = require 'telescope'

local angular = {}

angular.find_in_component = function()
  builtin.live_grep {
    prompt_title = 'Grep Angular content in component(.ts)',
    file_ignore_patterns = { 'node_modules', 'dist', '.git' },
    additional_args = function(_)
      return {
        '--iglob',
        '**/*.component.{ts}',
      }
    end,
  }
end

angular.find_in_component_template = function()
  builtin.live_grep {
    prompt_title = 'Grep Angular content in template(.html)',
    file_ignore_patterns = { 'node_modules', 'dist', '.git' },
    additional_args = function(_)
      return {
        '--iglob',
        '**/*.component.{html}',
      }
    end,
  }
end

return telescope.register_extension {
  exports = angular,
}
