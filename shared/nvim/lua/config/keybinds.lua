------------------------------------------------------------------------------
--# Key Bindings #------------------------------------------------------------

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


--# Motions #-----------------------------------------------------------------

Map('<C-u>', ':norm Hzz<CR>')                   -- better up scroll
Map('<C-d>', ':norm Lzz<CR>')                   -- better down scroll


--# Windows #-----------------------------------------------------------------

Map('ZE', ':Ex<CR>')                            -- Explore mode
Map('ZH', ':vsplit | :Explore<CR>')             -- RHS new pane
Map('ZV', ':split | :Explore<CR>')              -- Bottom new pane
Map('<leader>l', ':set colorcolumn=80<CR>')     -- show colorcolumn at 80
Map('<leader>L', ':set colorcolumn=<CR>')       -- hide colorcolumn

--# Conveniences #------------------------------------------------------------

vim.cmd([[command! -nargs=0 W w]])              -- :W work same as :w
Map('<leader>n', ':noh<CR>')                    -- clear searches (:noh)
Map('dA', ':norm gg0dG<CR>')                    -- delete everything
Map('yA', ':norm myLgg0yG``zb`y<CR>')           -- yank everything
Map('=A', ':norm myLgg=G``zb`y<cr>')            -- format the whole file
Map('<leader>R', ':norm Gpkdgg<CR>')            -- replace whole text
Map('<space>s', ':%s/', true, false)            -- faster %s
Map('<space>/', '/--#<CR> kztj<CR>')            -- jump headings
Map('<leader>p', ':reg<CR>')                    -- registers (paste) view

