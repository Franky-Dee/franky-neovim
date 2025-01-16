return {
  'echasnovski/mini.indentscope',
  version = '*',
  opts = { -- Configuration options for the plugin
    draw = {
      delay = 100,
      -- Define an animation function or set it to `nil` if not needed
      animation = function(step)
        return 20 -- Implements a constant 20ms between steps
      end,
      priority = 2,
    },

    mappings = {
      object_scope = 'ii',
      object_scope_with_border = 'ai',
      goto_top = '[i',
      goto_bottom = ']i',
    },

    options = {
      border = 'both',
      indent_at_cursor = true,
      try_as_border = false,
    },

    symbol = '╎',
  }
}

