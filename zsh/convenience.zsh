
#- SHORTCUTS -------------------------------------------------------------------
#- aliases and keybinds --------------------------------------------------------

# keybinds
bindkey -s '^[x' ' | clip.exe\n'      # copy output to clipboard

# List Files
alias l='eza -lag --color=always --group-directories-first --icons=always'
alias le="explorer.exe ."
alias ls='eza -g --icons=always'
alias la='eza -a --color=always --group-directories-first --icons=always'
alias tree='eza --long -T --group-directories-first --icons=always -L'
alias treg='eza --long -T --group-directories-first --icons=always --git-ignore -L --all'
trec() {
    eza -T --group-directories-first -F -L $1 | clip.exe
}

# Easier Calls
alias c='batcat -n'
alias cat='batcat -pp'
alias cp='cp -r'
alias htop=btop
alias figlet='figlet -f $DOTFILES/figlet/Line\ Blocks.flf -w $(tput cols)'
alias vim=$EDITOR

# NRF utils
nrfconnect() { /opt/nrf-desktop/nrfconnect --no-sandbox >/dev/null 2>&1 & disown %+; }
alias killnrfconnect='pkill -9 -f "/opt/nrf-desktop/nrfconnect" >/dev/null 2>&1 || true'

# System Packages
alias pkga='sudo apt install --no-install-recommends'
alias pkgr='sudo apt purge'
alias pkgx='sudo apt autoclean; sudo apt autoremove'
alias pkgl='dpkg -l | fzf -e'
pkgs() { apt-cache search $1 | fzf -e }

alias update='
    sudo echo;
    figlet "Update Packages";
    sudo apt update -y;
    sudo apt upgrade -y;

    figlet "System Cleanup"
    sudo apt autoclean;
    sudo apt autoremove;
'

