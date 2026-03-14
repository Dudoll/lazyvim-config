return {
  -- 禁用 LazyVim 默认主题
  { "folke/tokyonight.nvim", enabled = false },

  -- 可选：如果你之前启过其他主题，也一起禁用
  -- { "catppuccin/nvim", enabled = false },
  -- { "rebelot/kanagawa.nvim", enabled = false },

  -- 让 LazyVim 用 nvim 内置主题
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "habamax", -- 也可以改成 "habamax" / "elflord" / "industry" 等内置主题
    },
  },
}
