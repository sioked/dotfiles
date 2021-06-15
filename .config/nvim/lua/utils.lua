local utils = {}

utils.map = function(mode, key, result, opts)
  local options = {noremap=true, silent=true}
  if opts then 
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, key, result, options)
end

return utils
