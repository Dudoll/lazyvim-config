return {
  {
    "hamidi-dev/kaleidosearch.nvim",
    cmd = {
      "Kaleidosearch",
      "KaleidosearchAddWord",
      "KaleidosearchClear",
      "KaleidosearchInfo",
      "KaleidosearchToggleCursorWord",
    },
    keys = {
      {
        "<leader>hs",
        function()
          require("kaleidosearch").prompt_and_search()
        end,
        desc = "Set Keyword Highlights",
      },
      {
        "<leader>ha",
        function()
          require("kaleidosearch").add_new_word()
        end,
        desc = "Add Keyword Highlight",
      },
      {
        "<leader>hh",
        function()
          require("kaleidosearch").toggle_word_or_selection()
        end,
        mode = { "n", "x" },
        desc = "Toggle Keyword Highlight",
      },
      {
        "<leader>hc",
        function()
          require("kaleidosearch").clear_all_highlights()
        end,
        desc = "Clear Keyword Highlights",
      },
    },
    opts = {
      -- Code identifiers should not merge process with process_one, nor TASK
      -- with task. This keeps manual highlights precise during code review.
      case_sensitive = true,
      whole_word_match = true,
      keymaps = { enabled = false },
      -- Token coloring is unrelated to manual keyword tracking and would add a
      -- Python/tiktoken dependency, so keep that optional feature disabled.
      token_colors = { enabled = false },
    },
  },
}
