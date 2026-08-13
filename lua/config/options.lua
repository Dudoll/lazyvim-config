-- Options are automatically loaded before lazy.nvim startup
-- Default options: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Snacks.scroll powers smooth <C-u>/<C-d> movement. Keep animations enabled;
-- LazyVim can still toggle them at runtime with <leader>ua.
vim.g.snacks_animate = true

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
opt.tabstop = 8
opt.shiftwidth = 8
opt.softtabstop = 8
opt.expandtab = false
vim.g.autoformat = false
