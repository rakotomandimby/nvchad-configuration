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
  { "f-person/git-blame.nvim", event = "VeryLazy"}
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
