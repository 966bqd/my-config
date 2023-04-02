vim.opt.number = true
vim.opt.splitright = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.g.preview_markdown_parser = 'glow'
vim.g.preview_markdown_vertical = 1

-- keymap
vim.keymap.set('i', '{', '{}<Left>', {noremap = true})
vim.keymap.set('i', '{<Enter>', '{}<Left><CR><ESC><S-o>', {noremap = true})
vim.keymap.set('i', '(', '()<Left>', {noremap = true})
vim.keymap.set('i', '(<Enter>', '()<Left><CR><ESC><S-o>', {noremap = true})
vim.keymap.set('i', "'", "''<Left>", {noremap = true})
vim.keymap.set('i', '"', '""<Left>', {noremap = true})
vim.keymap.set('i', 'jj', '<ESC>', {noremap = true, silent = true})

vim.cmd('packadd vim-jetpack')
require('jetpack.packer').startup(function(use)
	use {'tani/vim-jetpack', opt = 1}
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-treesitter/nvim-treesitter'

	-- colorscheme
	use {'folke/tokyonight.nvim',branch = 'main'}
	use 'nvim-lualine/lualine.nvim'
	use { 'kyazdani42/nvim-web-devicons', opt = true }
	

	-- lsp setting
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

	-- cmp setting
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

	-- For vsnip users.
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'

	-- markdown setting
       	use 'skanehira/preview-markdown.vim'
	use 'godlygeek/tabular'
	use 'preservim/vim-markdown'

	-- fern
	use 'antoinemadec/FixCursorHold.nvim'
	use 'lambdalisue/fern.vim'
end)

vim.opt.completeopt = 'menu,menuone,noselect'
vim.cmd[[colorscheme tokyonight-moon]]

require('plugins.treesitter')
require('plugins.cmp')
require('lualine').setup()
-- lsp
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      on_attach = on_attach
    }
  end,
}

