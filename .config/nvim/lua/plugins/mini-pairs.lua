-- ~/.config/nvim/lua/plugins/mini-pairs.lua
-- This file enhances the default mini.pairs configuration.

return {
  {
    "echasnovski/mini.pairs",
    opts = {
      map = {
        -- the <CR> (Enter key) behavior.
        ["<CR>"] = {
          -- it creates a new line, indents it, and moves the closing pair down.
          action = "cr",
          option = {
            cr_like_newline = true, -- behaves like a normal newline if not inside a pair.
            cr_do_newline = true, -- actually inserts the newline character.
            cr_respect_after = true, -- respects characters after the cursor.
          },
        },
      },
    },
  },
}
