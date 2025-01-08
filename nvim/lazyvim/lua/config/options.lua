-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.g.mapleader = ","

vim.opt.title = true
vim.opt.clipboard = "" -- Do not mix system clipboard with editor clipboard
vim.opt.scrolloff = 10 -- Always see 10 lines around the cursor

-- Auto-wrap upon 100 chars
vim.opt.textwidth = 100

-- Visual cue to indicate the line is getting too long
for i = 80, 999 do
  table.insert(vim.opt.colorcolumn, i)
end
vim.cmd([[highlight ColorColumn ctermbg=gray guibg=gray]])
