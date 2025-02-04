local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local execute = vim.api.nvim_command

vim.api.nvim_set_keymap('n', '<SPACE>', '<Nop>', {})
vim.g.mapleader = " "
vim.opt.termguicolors = true

require('plugins')
require('options')
require('mappings')
require('plugins.completion')

-- enable mouse scroll
execute('set mouse=a')

vim.api.nvim_exec([[
autocmd BufLeave,FocusLost * silent! wall  " Save anytime we leave a buffer or MacVim loses focus.
autocmd BufWritePre * :%s/\s\+$//e " strip trailing whitespace on save
autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
]], false)
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
