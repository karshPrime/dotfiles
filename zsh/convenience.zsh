
#- SHORTCUTS -------------------------------------------------------------------
#- aliases and keybinds --------------------------------------------------------

# Keybinds
bindkey -s '^[c' ' | pbcopy\n'      # copy output to clipboard
bindkey -s '^[p' 'pbpaste > '       # paste clipboard content to a file
bindkey -s '^[n' ' | wc -l\n'       # count (Number of) results

# List Files
alias l='eza -lag --color=always --group-directories-first --icons'
alias ls='eza -g --icons'
alias la='eza -a --color=always --group-directories-first --icons'
alias tree='eza -T --group-directories-first --icons=always -L'
alias treg='eza -T --group-directories-first --icons=always --git-ignore -L'

# Easier Calls
alias c='bat -n'
alias cat='bat -pp'
alias cp=ditto
alias htop=btop
alias ntop='sudo bandwhich'
alias systemctl="brew services"

# Open files with set default application
of() {
    dir="${1:-.}"

    open "$dir/$(
        find "$dir/" -maxdepth 1 -type f | \
            grep -o -E "[^/]*$" | \
            sort | \
            fzf --height=40% --border=rounded
    )"
}


# Keyboard Remaps
fixkeyboard() {
    hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000029 },{ "HIDKeyboardModifierMappingSrc":0x700000029,"HIDKeyboardModifierMappingDst":0x700000035 }] }'
}

# Fixed Path
i() { c ~/Projects/.Info/$1 }
alias vols="gt /Volumes/"

# System Packages
alias pkga='brew install'
alias pkgr='brew uninstall --zap'
alias pkgs='brew search'
alias pkgl='brew list'
alias pkgi='brew info'
alias pkgx='brew cleanup --prune=all'

alias update='
    figlet "Update Packages";
    brew upgrade;
    brew update;
    python3 -m pip install --upgrade pip;

    figlet "System Cleanup"
    brew cleanup --prune=all;
    brew autoremove;
'

