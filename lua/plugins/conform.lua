return {
   {
      "stevearc/conform.nvim",

      keys = {
         {
            "<leader>mp",
            function()
               require("conform").format({
                  lsp_fallback = true,
                  async = false,
                  timeout_ms = 500,
               })
            end,
            desc = "Format file",
         },
      },

      config = function()
         require("conform").setup({
            formatters_by_ft = {
               cpp = { "clang-format" },
            },
         })
      end,
   },
}
