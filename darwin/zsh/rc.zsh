
#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ | | | | | | (__
# (_/___|___|_| |_|_|  \___|
#
# The idea is to have this as the only variable in the configs, such that
# everything else is system independent.
#

# Update PATH
if [[ ":$PATH:" != *"/opt/homebrew/bin:"* ]]; then
    PATH="/opt/homebrew/bin:$PATH:"
    PATH+="/Users/zul/Projects/.bin/:"
    PATH+="/Applications/Docker.app/Contents/Resources/bin/"

    export PATH
fi


# Default Editor
export EDITOR=nvim

# System Variables
ZFILES="$HOME/.config/zsh"
DOTFILES="$HOME/.config/dotfiles/darwin"
HACK_SCRIPTS="$HOME/Projects/SysHacks"

# Configuration Modules
source "$DOTFILES/zsh/define.zsh"       # init, exports & plugins
source "$DOTFILES/zsh/navigations.zsh"  # file processing
source "$DOTFILES/zsh/management.zsh"   # manage config files
source "$DOTFILES/zsh/convenience.zsh"  # aliases & keybinds
source "$DOTFILES/zsh/devenv.zsh"       # development shortcuts

# System Packages
export HOMEBREW_NO_ENV_HINTS=1
alias pkga='brew install'
alias pkgr='brew uninstall --zap'
alias pkgs='brew search'
alias pkgl='brew list'
alias pkgi='brew info'
alias pkgx='brew cleanup --prune=all'

update() {
    figlet "System Packages"
    brew upgrade
    brew update

    figlet "System Cleanup"
    brew cleanup --prune=all
    brew autoremove

    figlet "vim Plugins"
    nvim --headless "+Lazy! update" +qa
}

