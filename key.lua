-- Define leader
vim.g.mapleader = ' '

-- well used
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '<Leader>l', '$')
vim.keymap.set('n', '<Leader>h', '0')
vim.keymap.set('n', '<C-i>', '<Tab>', {noremap = true})


-- lspconfig keymapping
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})


-- bracket mapping
vim.keymap.set('i', '{', '{}<Left>', {noremap = true})
vim.keymap.set('i', '[', '[]<Left>', {noremap = true})
vim.keymap.set('i', '{<Enter>', '{}<Left><CR><ESC><S-o>', {noremap = true})
vim.keymap.set('i', '(', '()<Left>', {noremap = true})
vim.keymap.set('i', '(<Enter>', '()<Left><CR><ESC><S-o>', {noremap = true})
vim.keymap.set('i', "'", "''<Left>", {noremap = true})
vim.keymap.set('i', '"', '""<Left>', {noremap = true})
-- vim.keymap.set('i', 'jj', '<ESC>', {noremap = true, silent = true})

-- explorer
vim.keymap.set('n', '<Leader>o', '<cmd>Oil --float<CR>', {silent = true})

-- Screen split shortcut
vim.keymap.set('n', 'ss', ':split<Return><C-w>w', {noremap = true})
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w', {noremap = true})

vim.keymap.set('n', 'sh', '<C-w>h', {noremap = true})
vim.keymap.set('n', 'sj', '<C-w>j', {noremap = true})
vim.keymap.set('n', 'sk', '<C-w>k', {noremap = true})
vim.keymap.set('n', 'sl', '<C-w>l', {noremap = true})

-- buffer
vim.keymap.set('n', '<Tab>', '<cmd>BufferNext<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<S-Tab>', '<cmd>BufferPrevious<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<Leader>c', '<cmd>BufferClose<CR>', {noremap = true, silent = true})

-- telescope
vim.keymap.set('n', '<Leader>ff', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<Leader>fg', require('telescope.builtin').live_grep, {})
vim.keymap.set('n', '<Leader>fb', require('telescope.builtin').buffers, {})
vim.keymap.set('n', '<Leader>fh', require('telescope.builtin').help_tags, {})

-- rust-tools
vim.keymap.set('n', '<Leader>rr', '<cmd>RustRunnables<CR>', {noremap = true, silent = true})

