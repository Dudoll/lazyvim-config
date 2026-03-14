return {
  {
    "mason-org/mason.nvim",
    optional = true,
    opts = {
      ensure_installed = {
        "lua-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
              hint = {
                enable = true,
              },
            },
          },
        },
      },
    },
  },
}
