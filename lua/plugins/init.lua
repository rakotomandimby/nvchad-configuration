return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  { "github/copilot.vim",
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
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  { "f-person/git-blame.nvim",
    config = function()
      vim.g.gitblame_enabled = 0
      vim.g.gitblame_message_template = '                                <summary> • <date> • <author>'
      vim.g.gitblame_date_format = '%Y-%m-%d'
      vim.g.gitblame_enabled = 1
    end,
  },
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
