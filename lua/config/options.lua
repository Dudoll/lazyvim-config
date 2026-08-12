-- Options are automatically loaded before lazy.nvim startup
-- Default options: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Keep UI motion quiet during long code-reading sessions.
vim.g.snacks_animate = false

local opt = vim.opt

-- Terminal Neovim inherits its font from the terminal. This applies to Neovim GUIs.
opt.guifont = "JetBrainsMono Nerd Font:h14"

vim.o.mouse = ""
opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.cursorlineopt = "number"

-- Invisible characters stay hidden until explicitly toggled with <leader>uW.
opt.list = false
opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
}

-- Indentation is intentionally not overridden globally. Python and Linux kernel C
-- get project-aware settings from config/autocmds.lua; other projects keep their
-- LazyVim, EditorConfig, or project-local settings.
