return {
  "lervag/vimtex",
  init = function()
    local user_os = jit.os

    if user_os == "OSX" then
      vim.g.vimtex_view_general_viewer = "zathura"
    else
      vim.g.vimtex_view_general_viewer = "sumatraPDF"
      vim.g.vimtex_view_general_options = "-reuse-instance @pdf"
      vim.g.vimtex_view_general_options_latexmk = "-reuse-instance"
    end
  end,
}
