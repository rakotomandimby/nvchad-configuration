require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!
o.cursorline = true
o.cursorcolumn = true

local a = vim.api
a.nvim_command("au BufNewFile,BufRead *.ejs set filetype=html")
a.nvim_command("au BufNewFile,BufRead *.ejs LspStart html")
a.nvim_command("au BufNewFile,BufRead *.ejs Copilot enable")


