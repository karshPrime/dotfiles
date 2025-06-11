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

MapV = function(key, action, nrmap, quiet)
    if nrmap == nil then
        nrmap = true
    end
    if quiet == nil then
        quiet = true
    end
    vim.keymap.set({'n', 'v'}, key, action,
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

Map('ZZ', ':lua custom_zz()<CR>')     -- save close buffers as well
MapV('s', '"_d')                      -- delete without buffer
Map('S', '"_d$a')                     -- delete without buffer line
Map('X', '"_x')                       -- delete without buffer char
Map('<Esc>', '<Esc>:noh<CR>')         -- extend Esc to also hide search


--# Windows #-----------------------------------------------------------------

-- toggle color column
function ToggleColumn()
    if vim.wo.colorcolumn == "" then
        vim.wo.colorcolumn = "100"
    else
        vim.wo.colorcolumn = ""
    end
end
Map('<leader>l', ':lua ToggleColumn()<CR>')


-- toggle horizontal/vertical panes
local type = "vertical"
function RotatePanes()
    if type == "horizontal" then
        type = "vertical"
        vim.cmd('wincmd K')
    else
        type = "horizontal"
        vim.cmd('wincmd H')
    end
end
Map('<leader>w', ':lua RotatePanes()<CR>')


-- explore and panes
Map('ZE', ':Ex<CR>')                            -- Explore mode
Map('ZH', ':vsplit | :Explore<CR>')             -- RHS new pane
Map('ZV', ':split  | :Explore<CR>')             -- Bottom new pane


--# Conveniences #------------------------------------------------------------

vim.cmd([[command! -nargs=0 W w]])              -- :W work same as :w
vim.cmd([[command! -nargs=0 Wq wq]])            -- :W work same as :w

-- to whole file
Map('sA', 'gg"_dG<CR>')                         -- delete all without buffer
Map('dA', ':%delete<CR>')                       -- delete all with buffer
Map('yA', ':%yank<CR>')                         -- yank all
Map('=A', 'myLgg=G``zb`y<CR>:%s/ *$//g<CR>')    -- format the whole file
Map('<leader>R', 'gg"_dGp<CR>')                 -- replace whole text

-- faster actions
Map('<space>/', '/--#<CR> kztj<CR>')            -- jump headings
Map('<space>s', ':%s/', true, false)            -- faster %s
Map('<M-z>', 'zfi{')                            -- fold inside {}
Map('<M-Z>', 'zo')                              -- fold open
Map('<M-j>', '<Esc>jzz<CR>')


--# PlatformIO #--------------------------------------------------------------

Map('<leader>ai', ':Pioinit<CR>')
Map('<leader>am', ':Piomon<CR>')
-- alternatively use :Piomon <bodrate> for specific, non-specified rate
-- use :Piolib <search filter> to search and install libs. uses telescope.


--# Inserts #-----------------------------------------------------------------

inserts = function(key, action, nrmap, quiet)
    vim.keymap.set('i', key, action,
       { noremap = true, silent = true }
    )
end

-- autoclose brackets: get in
inserts('<M-9>', '(  )<Left><Left>')
inserts('<M-{>', '{  }<Left><Left>')
inserts('<M-[>', '[]<Left>')
inserts('<M-">', '""<Left>')
inserts("<M-'>", "''<Left>")

-- autoclose brackets: stay out
inserts('<M-0>', '()')
inserts('<M-)>', '( void )<CR>{<CR>}<Esc>O')
inserts('<M-]>', '[]')
inserts('<M-}>', '{}')

-- common actions
inserts("<M-;>", "<Esc>A;")
inserts("<M-=>", " == ")
inserts("<M-+>", " != ")
inserts("=", "= ")
inserts(",", ", ")

-- hjkl nav in insert mode
inserts("<M-h>", "<Esc>ha")
inserts("<M-j>", "<Esc>ja")
inserts("<M-k>", "<Esc>ka")
inserts("<M-l>", "<Esc>la")
inserts("<M-i>", "<Esc>I")
inserts("<M-a>", "<Esc>A")

-- insert new line
vim.keymap.set(
    {'n', 'i'}, "<leader>{", '<Esc>A {<CR>}<Esc>O',
    { noremap = true, silent = true }
)

