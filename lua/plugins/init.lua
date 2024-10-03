return {
  { "stevearc/conform.nvim", opts = require "configs.conform" },
  require "plugins.copilot",
  require "plugins.lspconfig",
  { "f-person/git-blame.nvim", event = "VeryLazy"},
  require "plugins.code-ai",
  require "plugins.lazygit",
}

