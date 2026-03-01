local g = vim.g

local ok, _ = pcall(vim.cmd, 'colorscheme onedark')
if not ok then
  vim.cmd 'colorscheme desert'
end

g.nord_cursor_line_number_background = 1
