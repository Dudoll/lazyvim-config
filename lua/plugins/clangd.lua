return {
  {
    "mason-org/mason.nvim",
    optional = true,
    opts = {
      ensure_installed = {
        "clangd",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- clangd will be automatically installed with mason and loaded with lspconfig
        clangd = {
          cmd = {
            "clangd",
            "--offset-encoding=utf-16",
            "--background-index=true",
            "--clang-tidy=true",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders=false",
          },
          settings = {
            clangd = {
              ---@type clangd.lsp.DiagnosticsConfiguration
              diagnostics = {
                enabled = true,
              },
              ---@type clangd.lsp.InlayHintsConfiguration
              inlayHints = {
                enabled = true,
                parameterNames = true,
                parameterTypes = true,
                deducedTypes = true,
                references = false,
                -- Only show inlay hints for the current line
                onlyCurrentLine = false,
              },
            },
          },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Add C and C++ parsers
      vim.list_extend(opts.ensure_installed, {
        "c",
        "cpp",
      })
    end,
  },
}
