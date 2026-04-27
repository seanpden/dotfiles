local function get_vault_path()
  local paths = {
    vim.fn.expand("~/Documents/my-vault"),
    vim.fn.expand("~/Files/my-vault"),
  }
  return vim.iter(paths):map(vim.fn.expand):find(vim.uv.fs_stat) or error("Obsidian vault not found on this machine!")
end

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
        path = get_vault_path(),
      },
    },
  },
}
