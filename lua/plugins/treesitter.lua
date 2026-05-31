return {
   {
      "nvim-treesitter/nvim-treesitter",
      lazy = false,
      build = ":TSUpdate",
      event = { "BufReadPre", "BufNewFile" },
      init = function()
         local highlight = function(bufnr, lang)
            if not vim.treesitter.language.add(lang) then
               return vim.notify(
                  string.format("treesitter cannot load parser for language: %s", lang),
                  vim.log.levels.INFO,
                  { title = "treesitter" }
               )
            end
            vim.treesitter.start(bufnr)
         end

         vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
               local ft = vim.bo.filetype
               local bt = vim.bo.buftype
               local buf = args.buf

               if bt ~= "" then
                  return
               end

               local ok, treesitter = pcall(require, "nvim-treesitter")
               if not ok then
                  return
               end

               if vim.fn.executable "tree-sitter" ~= 1 then
                  vim.api.nvim_echo({
                     {
                        "tree-sitter not found. Parsers cannot be installed.",
                        "ErrorMsg",
                     },
                  }, true, {})
                  return false
               end

               if not vim.treesitter.language.get_lang(ft) then
                  return
               end

               if vim.list_contains(treesitter.get_installed(), ft) then
                  highlight(buf, ft)
               elseif vim.list_contains(treesitter.get_available(), ft) then
                  treesitter.install(ft):await(function()
                     highlight(buf, ft)
                  end)
               end
            end,
         })
      end,
      opts = {
         install = {
            "vimdoc",
            "lua",
            "javascript",
            "typescript",
            "c",
            "python",
         },
      },
      config = function(_, opts)
         local treesitter = require "nvim-treesitter"
         treesitter.setup(opts)
         if vim.fn.executable "tree-sitter" ~= 1 then
            vim.api.nvim_echo({
               {
                  "tree-sitter not found. Parsers cannot be installed.",
                  "ErrorMsg",
               },
            }, true, {})
            return false
         end
         treesitter.install(opts.install)
      end,
   },
}
