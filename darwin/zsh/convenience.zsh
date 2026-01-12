
#- SHORTCUTS -------------------------------------------------------------------
#- aliases and keybinds --------------------------------------------------------

# Updated defaults behaviour
bindkey "^[l"     clear-screen
bindkey '^[[1;9D' backward-word
bindkey '^[[1;9C' forward-word
bindkey '^[[3~'   delete-char
bindkey '^[[1;9B' backward-kill-word
bindkey '^[[3;5~' kill-word

bindkey '^[[1;3D' beginning-of-line
bindkey '^[[1;3C' end-of-line

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Keybinds
bindkey -s '^[c' ' | pbcopy\n'      # copy output to clipboard
bindkey -s '^[p' 'pbpaste > '       # paste clipboard content to a file
bindkey -s '^[n' ' | wc -l\n'       # count (Number of) results

# Default Behaviour
alias cp=ditto
alias df='df -h'
alias diff='diff --color='always''
alias ed='ed -p "> "'
alias re='grep -o -E'
alias sed='sed -r'

# Common Actions
alias x=exit
alias up='cd ..'
alias weather='clear; curl wttr.in/melbourne'
alias path="echo $PATH | tr ':' '\n'"

# List Files
alias l='eza -lag --color=always --group-directories-first --icons'
alias ls='eza -g --icons'
alias la='eza -a --color=always --group-directories-first --icons'
alias tree='eza -T --group-directories-first --icons=always -L'
alias treg='eza -T --group-directories-first --icons=always --git-ignore -L'

# Easier Calls
alias c='bat -n'
alias cat='bat -pp'
alias htop=btop
alias ntop='sudo bandwhich'
alias pip='python3 -m pip'
alias py=python3
alias python=python3

# Fixed Path
i() { c ~/Projects/.Info/$1 }

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

