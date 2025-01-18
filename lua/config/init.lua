require("config/remap")
require("config/set")

local ensure_packer = function()
   local fn = vim.fn
   local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
   if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({
         "git",
         "clone",
         "--depth",
         "1",
         "https://github.com/wbthomason/packer.nvim",
         install_path,
      })
      vim.cmd [[packadd packer.nvim]]
      return true
   end
   return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
   use "wbthomason/packer.nvim"
   use {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.4",
      requires = {{
         "nvim-lua/plenary.nvim",
      }},
   }
   use("sakhnik/nvim-gdb")
   use {
      "nvim-treesitter/nvim-treesitter",
      run = function()
         local ts_update = require("nvim-treesitter.install")
            .update({ with_sync = true })
         ts_update()
      end
   }
   use("nvim-treesitter/playground")
   use("nvim-treesitter/nvim-treesitter-context")
   use("tpope/vim-fugitive")
   use("lewis6991/gitsigns.nvim")
   use("mfussenegger/nvim-lint")
   use {
      "VonHeikemen/lsp-zero.nvim",
      branch = "v1.x",
      requires = {
         { "neovim/nvim-lspconfig" },
         { "williamboman/mason.nvim" },
         { "williamboman/mason-lspconfig.nvim" },
         { "hrsh7th/nvim-cmp" },
         { "hrsh7th/cmp-buffer" },
         { "hrsh7th/cmp-path" },
         { "saadparwaiz1/cmp_luasnip" },
         { "hrsh7th/cmp-nvim-lsp" },
         { "hrsh7th/cmp-nvim-lua" },
      },
   }
   use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
   })
   use({
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
      ft = { "markdown" },
   })
end)
