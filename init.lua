vim.g.mapleader = " "
vim.g.colorcolumn = 80

vim.o.shell = "/bin/bash"
vim.opt.autoindent = true
vim.opt.backup = false
vim.opt.bg = 'dark'
vim.opt.clipboard = 'unnamed'
vim.opt.cursorline = true
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.foldmethod = 'manual'
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.listchars = {
    eol = '¬',
    tab = '-->',
    trail = '~',
    extends = '>',
    precedes = '<',
    space = '|'
}
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.scrolloff = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.shiftwidth = 4
vim.opt.showmatch = true
vim.opt.showtabline = 2
vim.opt.softtabstop = 4
vim.opt.sw = 4
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.writebackup = false

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
require("lazy").setup("plugins")

vim.cmd('colorscheme onedark')

vim.keymap.set("n", "<leader>gccd", ":!gcc -g % -o a<cr>", {desc = "Run C files"})
vim.keymap.set("n", "<leader>cppd", ":!g++ -g % -o a<cr>", {desc = "Run C++ files"})
vim.keymap.set("n", "<leader>rt", ":horizontal terminal<cr>", {desc = "Open a terminal"})
vim.keymap.set("n", "<leader>gcc", ":horizontal terminal gcc % -o main && ./main<cr>", {desc = "Run C files"})
vim.keymap.set("n", "<leader>cpp", ":horizontal terminal g++ % -o main && ./main<cr>", {desc = "Run C++ files"})
vim.keymap.set("n", "<leader>gor", ":horizontal terminal go run %<cr>", {desc = "Run Go files"})
vim.keymap.set("n", "<leader>gob", ":horizontal terminal go build -o main % && ./main<cr>", {desc = "Run Go files"})
vim.keymap.set("n", "<leader>java", ":horizontal terminal java %<cr>", {desc = "Run C++ files"})
vim.keymap.set("n", "<leader>py", ":horizontal terminal python3 %<cr>", {desc = "Run Python file"})
vim.keymap.set("n", "<leader>rb", ":horizontal terminal ruby %<cr>", {desc = "Run Ruby file"})
vim.keymap.set("n", "<leader>sh", ":horizontal terminal bash %<cr>", {desc = "Run bash file"})
vim.keymap.set("n", "<leader>run", ":horizontal terminal ./.run<cr>", {desc = "Run a personalized file"})
vim.keymap.set("n", "<leader>build", ":horizontal terminal ./.build<cr>", {desc = "Run a personalized file"})
vim.keymap.set("n", "<leader>clean", ":horizontal terminal ./.clean<cr>", {desc = "Run a personalized file"})
vim.keymap.set("n", "<leader>t", ":set list<cr>", {desc = "Show characters in editor"})
vim.keymap.set("n", "<leader>tt", ":set nolist<cr>", {desc = "Hide characters in editor"})
