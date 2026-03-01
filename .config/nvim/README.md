## Telescope
`<Leader>ff` / `<C-p>` Find files
`<Leader>fg` Live grep
`<Leader>fb` / `<Leader>bb` Find buffers
`<Leader>fc` / `<Leader>ch` Find command history
`<Leader>ft` Browse treesitter symbols

## nvim-tree
`<C-\>` Toggle open/close
`a` Add a file
`d` Delete a file
`c` Copy file path to clipboard
`p` Paste file from clipboard
`<BS>` Close currently opened directory
`r` Rename a file
`]c` Go to next git changed file
`[c` Go to prev git changed file
`-` Navigate up a dir
`<C-]>` Change working directory into selected dir
`I` Toggle show hidden files
`H` Toggle show dotfiles
`:NvimTreeFindFile` Display current file in the tree
`<C-v>` Open file in vertical split
`<CR>` Open file

## nvim-surround
`cs([` Change surrounding `(` with `[`
`ysiw)` Surround inner word with `()`
`ds"` Delete surrounding `"`

## nvim-cmp (completion)
`<C-Space>` Trigger completion
`<CR>` Confirm selection
`<C-e>` Abort / close completion
`<C-b>` / `<C-f>` Scroll docs up / down

## lspsaga
`<Leader>ca` / `<Leader>la` Code action
`<Leader>lh` / `K` Hover documentation (type info)
`<Leader>lr` Rename symbol
`<Leader>ld` Peek definition
`<C-j>` Jump to next diagnostic
`<C-k>` Jump to prev diagnostic

## Diagnostics
`<Leader>e` Show error/warning detail at cursor

## LSP
`<Leader>p` Format file (via efm / prettier)

## LSP servers
Managed by **mason.nvim**. Pre-configured servers (`ts_ls`, `eslint`) are auto-installed on startup.

`:Mason` Open the Mason UI to browse and install additional servers
`:MasonInstall <server>` Install a specific server (e.g. `:MasonInstall lua-language-server`)

## Commenting
`<Leader>cc` Toggle comment (normal and visual mode)

## General
`jk` / `kj` / `jj` Exit insert mode
`<C-s>` Increment number under cursor
`<Leader>rc` Edit init.lua
`<Leader>sv` Source init.lua
`<` / `>` Indent/dedent selection (stays selected)
