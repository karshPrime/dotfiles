
#-------------------------------------------------------------------------------
#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ | | | | | | (__
# (_/___|___|_| |_|_|  \___|
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------

# System specific configs
export DOTFILES="${${(%):-%N}:A:h:h}"   # path for system configs
export EDITOR=nvim                      # default text editor
export HOMEBREW_NO_ENV_HINTS=1          # Disable brew hints
export GOPATH=$HOME/.local/share/go     # Save path for go packages
export PATH="$HOME/.local/bin:$PATH"

# Initialise the system
source "$DOTFILES/zsh/init.zsh"

