return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>/", false },
    { "<leader>f/", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
  },
}
