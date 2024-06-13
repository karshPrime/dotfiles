------------------------------------------------------------------------------
--# Key Bindings #------------------------------------------------------------

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


--# Default Override #--------------------------------------------------------

-- save and close all
function custom_zz()
    if vim.fn.winnr('$') == 1 then
        vim.cmd('wqall')
    else
        vim.cmd('wq')
    end
end

Map('ZZ', ':lua custom_zz()<CR>')               -- save close buffers as well

Map('<C-u>', ':norm Hzz<CR>')                   -- better up scroll
Map('<C-d>', ':norm Lzz<CR>')                   -- better down scroll


--# Windows #-----------------------------------------------------------------

-- toggle color column
function ToggleColumn()
    if vim.wo.colorcolumn == "" then
        vim.wo.colorcolumn = "80"
    else
        vim.wo.colorcolumn = ""
    end
end

Map('<leader>l', ':lua ToggleColumn()<CR>')     -- toggle Column

Map('ZE', ':Ex<CR>')                            -- Explore mode
Map('ZH', ':vsplit | :Explore<CR><C-w>r')       -- RHS new pane
Map('ZV', ':split | :Explore<CR>')              -- Bottom new pane

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

