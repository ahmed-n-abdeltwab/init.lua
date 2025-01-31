-- Install lazylazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- UI Enhancements
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "nvim-lualine/lualine.nvim" },
  { "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons" -- Ensure devicons are included for better file type icons
  },

  -- Code Enhancements
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp", dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip"
  }},
  { "numToStr/Comment.nvim" },
  { "nvim-telescope/telescope.nvim", dependencies = "nvim-lua/plenary.nvim" },
  { "folke/which-key.nvim", url = "git@github.com:folke/which-key.nvim.git" },

  -- Treesitter (Syntax Highlighting & Better Parsing)
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "lua", "javascript", "python", "html", "css", "json" }, -- Add your needed languages
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end},

  -- Productivity
  { "rmagatti/auto-session" },
  { "iamcco/markdown-preview.nvim", build = "cd app && yarn install" },
  -- Track My Activity
  { "wakatime/vim-wakatime" },
})

