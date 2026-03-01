require('nvim-tree').setup {
  actions = {
    open_file = {
      quit_on_open = false
    }
  }
}

-- nvim-tree conflicts with the command-line window (q: / q/)
vim.api.nvim_create_autocmd("CmdwinEnter", {
  callback = function()
    vim.cmd("NvimTreeClose")
  end,
})
