return {
  -- Keep the previous explicit opt-out instead of loading two startup themes.
  { "folke/tokyonight.nvim", enabled = false },

  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "darker",
      transparent = false,
      term_colors = true,
      ending_tildes = false,
      code_style = {
        comments = "none",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },
      diagnostics = {
        darker = true,
        undercurl = true,
        background = false,
      },
    },
    config = function(_, opts)
      require("onedark").setup(opts)
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
