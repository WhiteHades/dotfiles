return {
  "Pocco81/auto-save.nvim",
  lazy = false,
  opts = {
    enabled = true,
    debounce_delay = 1350,
    execution_message = {
      message = function()
        return ""
      end,
    },
    trigger_events = { "InsertLeave", "TextChanged" },
  },
  keys = {
    { "<leader>uv", "<cmd>ASToggle<CR>", desc = "Toggle auto-save" },
  },
}
