return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      { "<leader>w", hidden = true },
      { "<leader>q", hidden = true },
      -- { "<leader>w", desc = "Write" },
      -- { "<leader>wm", hidden = true },
      -- { "<leader>wd", hidden = true },
      {
        "<leader>t",
        group = "windows",
        proxy = "<c-w>",
        expand = function()
          return require("which-key.extras").expand.win()
        end,
      },
    },
  },
}
