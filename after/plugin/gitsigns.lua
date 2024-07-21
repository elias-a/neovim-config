require("gitsigns").setup{
   on_attach = function(bufnr)
      local gitsigns = require("gitsigns")
      local opts = opts or {}
      opts.buffer = bufnr

      vim.keymap.set("n", "]c", function()
         if vim.wo.diff then
           vim.cmd.normal({ "]c", bang = true })
         else
           gitsigns.nav_hunk("next")
         end
      end, opts)
      vim.keymap.set("n", "[c", function()
         if vim.wo.diff then
           vim.cmd.normal({ "[c", bang = true })
         else
           gitsigns.nav_hunk("prev")
         end
      end, opts)
      vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, opts)
      vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk, opts)
      vim.keymap.set("v", "<leader>hs", function() 
         gitsigns.stage_hunk { vim.fn.line("."), vim.fn.line("v") }
      end, opts)
      vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer, opts)
      vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, opts)
   end
}
