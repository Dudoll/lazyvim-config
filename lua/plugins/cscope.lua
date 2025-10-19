return {
  {
    "dhananjaylatkar/cscope_maps.nvim",
    dependencies = {
      "folke/which-key.nvim", -- optional but nice for keybinding hints
    },
    config = function()
      require("cscope_maps").setup({
        -- optional config overrides
        disable_maps = false, -- keep default keymaps
        cscope = {
          db_file = "cscope.out", -- default database filename
          exec = "cscope", -- or "gtags-cscope" if you use GNU global
          -- picker = "fzf", -- or "fzf-lua", "quickfix"
        },
      })
    end,
  },
}
