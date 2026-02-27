
# Defines ----------------------------------------------------------------------
# set up most basic common defaults --------------------------------------------

# Updated defaults behaviour
bindkey "^[l"     clear-screen
bindkey '^[[1;9D' backward-word
bindkey '^[[1;9C' forward-word
bindkey '^[[3~'   delete-char
bindkey '^[[1;9B' backward-kill-word
bindkey '^[[3;5~' kill-word

bindkey '^[[1;3D' beginning-of-line
bindkey '^[[1;3C' end-of-line

bindkey '^[[A'    up-line-or-search
bindkey '^[[B'    down-line-or-search

# Default Behaviour
alias df='df -h'
alias diff='diff --color='always''

# Common Actions
alias x=exit
alias up='cd ..'
alias weather='clear; curl wttr.in/melbourne'
alias path="echo $PATH | tr ':' '\n'"

