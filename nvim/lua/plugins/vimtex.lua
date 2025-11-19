return {
  -- vimtex plugin for LaTex files editing
  "lervag/vimtex",
  config = function()
    vim.cmd("filetype plugin indent on")
    vim.cmd("syntax  enable")
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_method = "pdflatex"
  end,
}
