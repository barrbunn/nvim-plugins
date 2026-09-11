-- 1. Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Set your leader key (important to do before loading plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 3. Setup lazy.nvim and add your plugins
require("lazy").setup({
  spec = {
    { "folke/which-key.nvim", event = "VeryLazy" },
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd.colorscheme("tokyonight")
      end,
    },
    { import = "plugins.telescope" },
    { import = "plugins.lsp-setup" },
    { import = "plugins.treesitter" },
    { import = "plugins.notify" },
    { import = "plugins.noice" },
  },
  -- Optional: Configure lazy.nvim settings
  checker = { enabled = true }, -- automatically check for plugin updates
})

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

autocmd("DiagnosticChanged", {
  callback = function()
    vim.diagnostic.setloclist({ open = false })
  end,
})
