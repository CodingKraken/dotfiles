return {
  -- add gruvbox
  { "sainnhe/gruvbox-material" },

  {
    "LazyVim/LazyVim",
    opts = {
      vim.cmd([[ let g:gruvbox_material_foreground = "original" ]]),
      vim.cmd([[ let g:gruvbox_material_background = "hard" ]]),

      colorscheme = "gruvbox-material",
    },
  },
}
