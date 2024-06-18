local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require('lazy').setup({
   {  "catppuccin/nvim", name = "catppuccin", priority = 1000 },
   {
      'nvim-telescope/telescope.nvim', tag = '0.1.6',                         dependencies = { 'nvim-lua/plenary.nvim' }    
    },

    -- File tree
    {
       "nvim-tree/nvim-tree.lua",
       version = "*",
       lazy = false,
       requires = {
	 "nvim-tree/nvim-web-devicons",
       },
       config = function()
	   require("nvim-tree").setup {}
	 end,
    },

    -- Visualize buffers as tabs
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
})
