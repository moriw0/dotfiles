-- 共通設定（.vimrc / .ideavimrc と共有）
vim.cmd("source " .. vim.fn.expand("~/dotfiles/vim/common.vim"))

-- nvim 固有設定
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.g.maplocalleader = "\\"

-- Bootstrap lazy.nvim
require("config.lazy")
