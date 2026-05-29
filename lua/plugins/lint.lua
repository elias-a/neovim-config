return {
   {
      "mfussenegger/nvim-lint",

      event = {
         "BufReadPre",
         "BufNewFile",
      },

      config = function()
         local lint = require("lint")

         lint.linters_by_ft = {
            python = { "flake8" },
         }

         vim.api.nvim_create_autocmd(
            { "BufWritePost" },
            {
               callback = function(args)
                  require("lint").try_lint(nil, {
                     ignore_errors = true,
                  })
               end,
            }
         )
      end,
   },
}
