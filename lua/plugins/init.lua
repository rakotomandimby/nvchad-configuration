return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  { "github/copilot.vim", 
    event = "VeryLazy",
    config = function()
      vim.keymap.set('i', '<M-CR>',       'copilot#Accept("\\<CR>")', {expr = true,replace_keycodes = false})
      vim.keymap.set('i', '<M-Right>',    'copilot#AcceptWord()',     {expr = true,replace_keycodes = false})
      vim.keymap.set('i', '<M-Down>',     'copilot#AcceptLine()',     {expr = true,replace_keycodes = false})
      vim.keymap.set('i', '<M-Esc>',      'copilot#Suggest()',        {expr = true,replace_keycodes = false})
      vim.keymap.set('i', '<M-PageUp>',   'copilot#Previous()',       {expr = true,replace_keycodes = false})
      vim.keymap.set('i', '<M-PageDown>', 'copilot#Next()',           {expr = true,replace_keycodes = false})
      vim.g.copilot_no_tab_map = true
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      require "configs.lspconfig"
    end,
  },
  { "f-person/git-blame.nvim", event = "VeryLazy"},

  -- install LazyGit
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  }
}

