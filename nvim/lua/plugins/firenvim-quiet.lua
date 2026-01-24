if not vim.g.started_by_firenvim then
  return {}
end

-- Disable nvim-lint entirely inside Firenvim
local plugins = {
  { "mfussenegger/nvim-lint", enabled = false },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "FileType" }, {
  callback = function(args)
    vim.b[args.buf].autoformat = false
    vim.diagnostic.enable(false, { bufnr = args.buf })
  end,
})

return plugins
