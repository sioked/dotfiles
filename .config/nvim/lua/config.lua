local vimopt = vim.opt
local o = vim.o
local g = vim.g
local b = vim.bo
local w = vim.wo

local function opt(o, v)
  vimopt[o] = v
end

-- Global options
o.mouse = 'a'
o.clipboard = 'unnamedplus'
o.syntax = 'enable'
o.showmatch = true
o.splitright = true
o.splitbelow = true
o.smartcase = true
o.lazyredraw = true

-- Buffer options
b.expandtab = true
b.shiftwidth = 2
b.tabstop = 4
b.smartindent = true

-- Window options
w.number = true
w.relativenumber = true
w.cursorcolumn = true
w.cursorline = true
