local palette = {
  { bg = "#E5C07B", ctermbg = 180 }, -- yellow
  { bg = "#98C379", ctermbg = 114 }, -- green
  { bg = "#61AFEF", ctermbg = 75 }, -- blue
  { bg = "#C678DD", ctermbg = 176 }, -- purple
  { bg = "#E06C75", ctermbg = 168 }, -- coral
  { bg = "#56B6C2", ctermbg = 73 }, -- cyan
  { bg = "#D19A66", ctermbg = 173 }, -- orange
  { bg = "#E5A1C4", ctermbg = 175 }, -- pink
}

local function apply_palette()
  for index, color in ipairs(palette) do
    vim.api.nvim_set_hl(0, "HiColor" .. index, {
      fg = "#1E222A",
      bg = color.bg,
      ctermfg = 235,
      ctermbg = color.ctermbg,
    })
  end
end

local function run_highlighter(command)
  vim.fn["highlighter#Command"](command)
  vim.cmd.nohlsearch()
end

local function keyword_pattern(word)
  return [[\V\<]] .. vim.fn.escape(word, [[\]]) .. [[\>]]
end

local function add_keyword(word)
  word = vim.trim(word or "")
  if word ~= "" then
    run_highlighter("+ " .. keyword_pattern(word))
  end
end

local function prompt_keywords(replace)
  vim.ui.input({
    prompt = replace and "Highlight keywords (space-separated): " or "Add highlight keyword(s): ",
  }, function(input)
    if not input or vim.trim(input) == "" then
      return
    end

    if replace then
      run_highlighter("clear")
    end
    for word in input:gmatch("%S+") do
      add_keyword(word)
    end
  end)
end

return {
  {
    "azabiong/vim-highlighter",
    cmd = { "Hi", "HI" },
    keys = {
      {
        "<leader>hh",
        function()
          run_highlighter("+")
        end,
        desc = "Toggle Keyword Background",
      },
      {
        "<leader>hh",
        function()
          run_highlighter("+x")
        end,
        mode = "x",
        desc = "Toggle Selection Background",
      },
      {
        "<leader>hs",
        function()
          prompt_keywords(true)
        end,
        desc = "Set Keyword Backgrounds",
      },
      {
        "<leader>ha",
        function()
          prompt_keywords(false)
        end,
        desc = "Add Keyword Backgrounds",
      },
      {
        "<leader>hc",
        function()
          run_highlighter("clear")
        end,
        desc = "Clear Keyword Backgrounds",
      },
      {
        "]h",
        function()
          run_highlighter(">")
        end,
        desc = "Next Keyword Highlight",
      },
      {
        "[h",
        function()
          run_highlighter("<")
        end,
        desc = "Previous Keyword Highlight",
      },
    },
    init = function()
      -- Use only the mappings above and make <leader>hh a real toggle.
      vim.g.HiMapKeys = 0
      vim.g.HiSetToggle = 1
      -- Keep manual code-reading marks static and visually quiet.
      vim.g.HiEffectOne = 0
      vim.g.HiCursorGuide = 0
    end,
    config = function()
      apply_palette()
      local group = vim.api.nvim_create_augroup("code_reading_highlight_palette", { clear = true })
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = group,
        callback = apply_palette,
      })
    end,
  },
}
