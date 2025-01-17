
#- SHORTCUTS -------------------------------------------------------------------
#- aliases and keybinds --------------------------------------------------------

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
alias weather='curl wttr.in/melbourne'
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
i() { c ~/Documents/Info/$1 }

