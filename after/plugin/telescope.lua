local builtin = require("telescope.builtin")
local telescope = require("telescope")

telescope.setup({
   defaults = {
      file_ignore_patterns = {
         "%.git/",
         "node_modules/",
         "build/",
         "dist/",
         "venv/",
         "__pycache__/",
         "%.DS_Store",
         "%.vscode",
         "CMakeFiles/",
         "%.solid/",
         "ios/Pods/",
         ".tox/",
         "%.pytest_cache/",
         "%.eggs",
         "%.egg%-info/",
         "%.idea",
         "%.so%.",
         "%.so$",
      },
   },
   pickers = {
      find_files = {
         hidden = true,
         no_ignore = true,
      },
   },
})

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
   builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
