----------------------------------------------------------------------------------------
--# Key Bindings #----------------------------------------------------------------------

-- J combines the current line with the one bellow

Map = function(key, action, nrmap, quiet)
    if nrmap == nil then
        nrmap = true
    end
    if quiet == nil then
        quiet = true
    end
    vim.keymap.set('n', key, action,
        { noremap = nrmap, silent = quiet }
    )
end


--# Motions #---------------------------------------------------------------------------

Map('<C-u>', ':norm Hzz<CR>')                   -- better up scroll
Map('<C-d>', ':norm Lzz<CR>')                   -- better down scroll


--# Windows #---------------------------------------------------------------------------

Map('ZE', ':Ex<CR>')                            -- Explore mode
Map('ZH', ':vsplit | :Explore<CR>')             -- RHS new pane
Map('ZV', ':split | :Explore<CR>')              -- Bottom new pane
Map('<leader>l', ':set colorcolumn=100<CR>')    -- show colorcolumn at 100
Map('<leader>L', ':set colorcolumn=<CR>')       -- hide colorcolumn


--# Development #-----------------------------------------------------------------------

Map('<F5>', ':w<CR>:!./upload.sh<CR>')          -- call upload script
Map('<F6>', ':w<CR>:!cargo run<CR>')            -- run cargo run
Map('<F7>', ':w<CR>:!cargo build<CR>')          -- run cargo build
Map('<F8>', ':w<CR>:term make<CR>')             -- run make command


--# Conveniences #----------------------------------------------------------------------

vim.cmd([[command! -nargs=0 W w]])              -- :W work same as :w
Map('<leader>n', ':noh<CR>')                    -- clear searches (:noh)
Map('dA', ':norm gg0dG<CR>')                    -- delete everything
Map('yA', ':norm myLgg0yG``zb`y<CR>')           -- yank everything
Map('<space>s', ':%s/', true, false)            -- faster %s
Map('<space>/', '/--# <CR>')                    -- jump headings
Map('<leader>r', ':reg<CR>')                    -- registers view

