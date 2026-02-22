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
export EDITOR=/opt/nvim-linux-x86_64/bin/nvim

# Update PATH
if [[ ":$PATH:" != *"$HOME/.local/bin"* ]]; then
    PATH="/opt/homebrew/bin:$PATH"
    PATH+=":$HOME/.local/bin"

    export PATH
fi

# Initialise the system
source "$DOTFILES/zsh/init.zsh"


# nrfutil autocomplete
[[ -r "${HOME}/.nrfutil/share/nrfutil-completion/scripts/zsh/setup.zsh" ]] && \
    . "${HOME}/.nrfutil/share/nrfutil-completion/scripts/zsh/setup.zsh"

