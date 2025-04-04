
--             _             _
--  _ ____   _(_)_ __ ___   | |_   _  __ _
-- | '_ \ \ / | | '_ ` _ \  | | | | |/ _` |
-- | | | \ V /| | | | | | |_| | |_| | (_| |
-- |_| |_|\_/ |_|_| |_| |_(_|_|\__,_|\__,_|
--

-- bindings
require("binds.keybinds")
require("binds.vimbinds")
require("binds.shellbinds")

if not vim.g.vscode then
    -- plugins
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

    require("plugins")
end

