
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
alias gitl='git log'
alias gitk='git checkout'
alias gitb='git branch -a'
alias gitu="git reset --soft 'HEAD^'"
alias giti='onefetch --no-title --no-color-palette -d churn -d head --no-art'

# Docker Shortcuts -------------------------------------------------------------

alias d=lazydocker




