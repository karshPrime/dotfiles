
#- DEVELOPMENT -----------------------------------------------------------------
#- shortcuts for common dev actions --------------------------------------------

# Git Shortcuts ----------------------------------------------------------------

gitg() { git clone --depth=1 git@github.com:$1.git; cd $(basename $1) }
gitR() { git rebase -i HEAD~$1 }
gitt() { touch $1; git add $1; git commit -m "create $1" }

alias g=lazygit
alias gits='git status'
alias gitS='git switch'
alias gitP='git push'
alias gitp='git pull'
alias gitk='git checkout'
alias gitb='git branch -a'
alias gitu="git reset --soft 'HEAD^'"
alias giti='onefetch --no-title --no-color-palette -d churn -d head --no-art'


# TMux Launch Shortcuts --------------------------------------------------------

alias tml="tmux ls"
alias tmK="tmux kill-session"
alias tmL="tmux ls | fzf --height=40% --border=rounded | cut -f 1 -d ':'"

tmk() { tmux kill-session -t $(tmL) }
tma() { tmux attach-session -t $(tmL) }

