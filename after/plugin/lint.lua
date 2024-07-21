require("lint").linters_by_ft = {
   markdown = { "python", }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
   callback = function()
      require("lint").try_lint()
      require("lint").try_lint("Flake8")
   end,
})
