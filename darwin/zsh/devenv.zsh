
#- DEVELOPMENT -----------------------------------------------------------------
#- shortcuts for common dev actions --------------------------------------------

# Vim Shortcuts ----------------------------------------------------------------

v() {
    if [ "$#" -lt 2 ]; then
        $EDITOR $1
    elif [ "$(tput cols)" -lt 126 ]; then
        $EDITOR -o2 $@
    else
        $EDITOR -O2 $@
    fi
}

alias sv="sudo $EDITOR"


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


# Hack Scripts -----------------------------------------------------------------

alias pinit=". $HACK_SCRIPTS/project_initialise.sh"

jlab() {
	"$HACK_SCRIPTS/project_initialise.sh" "$1.java"
	mv "$1" "lab$2"
	cd "lab$2"
	rm -rf ./.git* ./README.md ./LICENSE
}

