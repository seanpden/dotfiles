return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in 4.0.0
    -- ui = { enable = false }, -- conflicts with render-markdown.nvim
    -- note = {
    --   id_func = require("obsidian.builtin").title_id,
    -- },
    note_id_func = function(title)
      return require("obsidian.builtin").title_id(title)
    end,
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/my-vault/",
      },
    },
  },
}
