return {
  {
    "saghen/blink.cmp",
    opts = {
      enabled = function()
        local disabled = { "markdown", "text" }
        local filetype = vim.bo.filetype
        return not vim.tbl_contains(disabled, filetype)
      end,
    },
  },
}
