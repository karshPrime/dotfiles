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

# Update PATH
if [[ ":$PATH:" != *"$HOME/.local/bin"* ]]; then
    PATH="/opt/homebrew/bin:$PATH"
    PATH+=":$HOME/.local/bin"

    export PATH
fi

# Initialise the system
source "$DOTFILES/zsh/init.zsh"

