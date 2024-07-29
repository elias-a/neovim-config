vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.cmd [[colorscheme blue]]

vim.api.nvim_create_autocmd("FileType", {
   pattern = { "py", "sql" },
   command = "setlocal shiftwidth=4 tabstop=4 softtabstop=4"
})

vim.api.nvim_create_autocmd("FileType", {
   pattern = { "tex", "lua" },
   command = "setlocal shiftwidth=3 tabstop=3 softtabstop=3"
})
