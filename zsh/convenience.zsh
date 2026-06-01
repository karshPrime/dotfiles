
#- SHORTCUTS -------------------------------------------------------------------
#- aliases and keybinds --------------------------------------------------------

# keybinds
bindey -s '^[x' ' | clip.exe\n'      # copy output to clipboard

# List Files
alias c=copilot
alias r=ranger
alias l='eza -lag --color=always --group-directories-first --icons=always'
alias le="explorer.exe ."
alias ls='eza -g --icons=always'
alias la='eza -a --color=always --group-directories-first --icons=always'
alias tree='eza --long -T --group-directories-first --icons=always -L'
alias treg='eza --long -T --group-directories-first --icons=always --git-ignore --all -L '
trec() {
    eza -T --group-directories-first -F -L $1 | clip.exe
}

# Easier Calls
alias cat='bat -pp'
alias cp='cp -r'
alias htop=btop

winc() { cp $@ /mnt/d/LinShare/. }
winm() { mv $@ /mnt/d/LinShare/. }

# NRF utils
nrfconnect() { /opt/nrf-destop/nrfconnect --no-sandbox >/dev/null 2>&1 & disown %+; }
alias killnrfconnect='pkill -9 -f "/opt/nrf-desktop/nrfconnect" >/dev/null 2>&1 || true'

# System Packages
alias pkga='sudo apt install --no-install-recommends'
alias pkgr='sudo apt purge'
alias pkgx='sudo apt autoclean; sudo apt autoremove'
alias pkgl='dpkg -l | fzf -e'
pkgs() { apt-cache search $1 | fzf -e }

alias update='
    sudo echo;
    figlet "System Packages";
    sudo apt update -y;
    sudo apt upgrade -y;
    echo

    figlet "Vim Plugins"
    vim --headless +"lua vim.pack.update()" +"wq" +qa;
    echo -e "\n"

    figlet "System Cleanup";
    sudo apt autoclean;
    sudo apt autoremove;
'

