-------------------------------------------------------------------------------
--# Platform IO #--------------------------------------------------------------

-- Initialise Project
Map('<leader>`', ':Pioinit<CR>')

-- Compile & Run
Map('`<leader>r', ':Piorun<CR>')
Map('`<leader>b', ':Piorun build<CR>')

-- Debug
Map('`<leader>d', ':Piodebug<CR>')

-- Monitor
Map('`<leader>m', ':Piomon<CR>')
---- alternatively use :Piomon <bodrate> for specific, 
---- non-specified rate

-- Libraries
---- use :Piolib <search filter> to search and install libs.
---- uses telescope

-- Docs
---- :help PlatformIO

