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
Map('s', '"_d')                                 -- delete without buffer
Map('S', '"_d$a')                               -- delete without buffer line
Map('X', '"_x')                                 -- delete without buffer char
Map('<Esc>', '<Esc>:noh<CR>')                   -- extend Esc to also hide search
Map('<CR>', 'zo<CR>')                           -- unfold with Return


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
Map('sA', 'gg"_dG<CR>')                         -- delete without buffer all
Map('dA', 'gg0dG<CR>')                          -- delete with buffer all
Map('yA', 'myLgg0yG``zb`y<CR>')                 -- yank all
Map('=A', 'myLgg=G``zb`y<CR>:%s/ *$//g<CR>')    -- format the whole file
Map('<leader>R', 'gg"_dGp<CR>')                 -- replace whole text
Map('<space>/', '/--#<CR> kztj<CR>')            -- jump headings
Map('<space>s', ':%s/', true, false)            -- faster %s

Map('<M-s>', '! tmux choose-session -Z<CR>')

