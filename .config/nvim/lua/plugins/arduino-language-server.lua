return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      arduino_language_server = {
        cmd = {
          "arduino-language-server",
          "-clangd",
          vim.fn.expand("~/.local/share/nvim/mason/bin/clangd"),
          "-cli",
          "/usr/bin/arduino-cli",
          "-cli-config",
          vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
          "-fqbn",
          "arduino:avr:uno",
        },
      },
    },
  },
}
