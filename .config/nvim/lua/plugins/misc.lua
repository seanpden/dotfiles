return {
  "lervag/vimtex",
  init = function()
    vim.g.vimtex_view_general_viewer = "sumatraPDF"
    vim.g.vimtex_view_general_options = "-reuse-instance @pdf"
    vim.g.vimtex_view_general_options_latexmk = "-reuse-instance"
  end,
}
