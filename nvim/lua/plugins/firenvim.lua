return {
  "glacambre/firenvim",

  -- keep it out of terminal sessions, but still installable
  lazy = not vim.g.started_by_firenvim,
  module = false,

  build = function()
    -- ensure firenvim is on runtimepath before calling firenvim#install
    require("lazy").load({ plugins = { "firenvim" }, wait = true })
    vim.fn["firenvim#install"](0)
  end,

  config = function()
    vim.g.firenvim_config = {
      localSettings = {
        [".*"] = {
          takeover = "never",
          selector = 'textarea:not([readonly]), div[role="textbox"]',
        },
      },
    }
  end,
}
