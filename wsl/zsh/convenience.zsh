
#- SHORTCUTS -------------------------------------------------------------------
#- aliases and keybinds --------------------------------------------------------

# List Files
alias l='eza -lag --color=always --group-directories-first --icons'
alias ls='eza -g --icons'
alias la='eza -a --color=always --group-directories-first --icons'
alias tree='eza -T --group-directories-first --icons=always -L'
alias treg='eza -T --group-directories-first --icons=always --git-ignore -L'
trec() {
    eza -T --group-directories-first -F -L $1 | clip.exe
}

# Easier Calls
alias c='batcat -n'
alias cat='batcat -pp'
alias htop=btop
alias ntop='sudo bandwhich'
alias figlet='figlet -f $DOTFILES/figlet/Line\ Blocks.flf -w $(tput cols)'
alias g=lazygit
alias d=lazydocker

# System Packages
alias pkga='sudo apt install --no-install-recommends'
alias pkgr='sudo apt purge'
alias pkgs='apt search'
alias pkgx='sudo apt autoclean; sudo apt autoremove'
alias pkgl='
    apt list --installed |\
    fzf -i --cycle --ansi --color=dark --layout=reverse --pointer='▶ '\
    --prompt='  '
'

alias update='
    sudo echo;
    figlet "Update Packages";
    sudo apt update -y;
    sudo apt upgrade -y;

    figlet "System Cleanup"
    sudo apt autoclean;
    sudo apt autoremove;
'

