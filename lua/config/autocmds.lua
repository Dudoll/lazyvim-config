-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

local group = vim.api.nvim_create_augroup("code_reading_layout", { clear = true })

local function exists(path)
  return vim.uv.fs_stat(path) ~= nil
end

local function is_linux_kernel_tree(buf)
  if vim.b[buf].linux_kernel_style ~= nil then
    return vim.b[buf].linux_kernel_style
  end

  local filename = vim.api.nvim_buf_get_name(buf)
  if filename == "" then
    return false
  end

  local start = vim.fs.dirname(vim.fs.normalize(filename))

  -- A zero-code project-local opt-in for kernel-derived trees that do not carry
  -- every upstream marker. Place an empty .nvim-linux-kernel file at project root.
  local marker = vim.fs.find(".nvim-linux-kernel", {
    path = start,
    upward = true,
    type = "file",
  })[1]
  if marker then
    return true
  end

  local dirs = { start }
  for dir in vim.fs.parents(start) do
    dirs[#dirs + 1] = dir
  end

  for _, dir in ipairs(dirs) do
    if
      exists(vim.fs.joinpath(dir, "Kbuild"))
      and exists(vim.fs.joinpath(dir, "Kconfig"))
      and exists(vim.fs.joinpath(dir, "MAINTAINERS"))
      and exists(vim.fs.joinpath(dir, "include", "linux", "kernel.h"))
    then
      return true
    end
  end

  return false
end

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "python",
  callback = function(event)
    local bo = vim.bo[event.buf]
    bo.expandtab = true
    bo.tabstop = 4
    bo.shiftwidth = 4
    bo.softtabstop = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "c",
  callback = function(event)
    if not is_linux_kernel_tree(event.buf) then
      return
    end

    local bo = vim.bo[event.buf]
    bo.expandtab = false
    bo.tabstop = 8
    bo.shiftwidth = 8
    bo.softtabstop = 0
  end,
})

local function update_colorcolumn(event)
  local buf = event.buf or vim.api.nvim_get_current_buf()
  local filetype = vim.bo[buf].filetype
  local colorcolumn

  if filetype == "python" then
    colorcolumn = "88"
  elseif filetype == "c" and is_linux_kernel_tree(buf) then
    colorcolumn = "80,100"
  end

  if colorcolumn then
    vim.wo.colorcolumn = colorcolumn
    vim.w.code_reading_colorcolumn = true
  elseif vim.w.code_reading_colorcolumn then
    -- Clear only a ruler previously installed by this autocmd. Do not overwrite a
    -- project-local ruler for unrelated buffers.
    vim.wo.colorcolumn = ""
    vim.w.code_reading_colorcolumn = nil
  end
end

vim.api.nvim_create_autocmd({ "FileType", "BufWinEnter", "WinEnter" }, {
  group = group,
  callback = update_colorcolumn,
})
