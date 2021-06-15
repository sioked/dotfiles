-- local map = vim.api.nvim_set_keymap
function map(mode, key, result, opts)
  local options = {noremap=true, silent=true}
  if opts then 
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, key, result, options)
end

-- keep selected text when indenting  --
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Remap C-s to increment a number under cursor --

map('n', '<C-s>', '<C-a>')

-- Telescope --
map('n', '<Leader>ff', ':Telescope find_files<CR>')
map('n', '<C-p>', ':Telescope find_files<CR>')
map('n', '<Leader>fg', ':Telescope live_grep theme=get_ivy<CR>')
map('n', '<Leader>bb', ':Telescope buffers theme=get_dropdown<CR>')
map('n', '<Leader>ch', ':Telescope command_history theme=get_dropdown<CR>')

-- Commenting --
map('n', '<Leader>cc', ':CommentToggle<CR>')
map('v', '<Leader>cc', ':\'<,\'>CommentToggle<CR>')

-- Remapping for escape --
map('i', 'jk', '<ESC>')
map('i', 'kj', '<ESC>')
map('i', 'jj', '<ESC>')

-- Nvim Tree --
map('n', '<C-\\>', ':NvimTreeToggle<CR>')
map('i', '<C-\\>', ':NvimTreeToggle<CR>')
