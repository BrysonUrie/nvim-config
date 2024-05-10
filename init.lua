-- Import non-plugin config
require("config")

-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
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
-- Configure lazy.nvim from plugins directory
require("lazy").setup({
    spec = { { import = "plugins" } },
    change_detection = { enabled = false }
})

vim.cmd([[
    autocmd FileType python map <buffer> <F9> :w<CR>:!poetry run python %<CR>
    autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:!poetry run python %<CR>
]])

