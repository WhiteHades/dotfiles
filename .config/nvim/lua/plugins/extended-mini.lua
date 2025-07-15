return {
  "echasnovski/mini.files",
  keys = {
    {
      "<leader>e",
      desc = "Open mini.files (directory of current file)",
    },
    {
      "<leader>E",
      function()
        require("mini.files").open(vim.uv.cwd(), true)
      end,
      desc = "Open mini.files (cwd)",
    },
    {
      "<leader>fm",
      function()
        require("mini.files").open(LazyVim.root(), true)
      end,
      desc = "Open mini.files (root)",
    },
  },
  opts = {
    windows = {
      width_nofocus = math.floor(vim.o.columns * 0.2),
      width_focus = math.floor(vim.o.columns * 0.3),
      width_preview = math.floor(vim.o.columns * 0.5),
    },
    options = {
      use_as_default_explorer = true,
    },
  },
  config = function(_, opts)
    require("mini.files").setup(opts)

    vim.keymap.set("n", "<leader>e", function()
      local path = vim.api.nvim_buf_get_name(0)
      if path == "" then
        path = vim.uv.cwd() or vim.fn.getcwd() or ""
      else
        local sep = package.config:sub(1, 1)
        path = path:match("(.*" .. sep .. ")")
      end
      require("mini.files").open(path, true)
    end, { desc = "Open mini.files (directory of current file)" })
  end,
}
