
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

gitg() { git clone --depth=1 --recursive git@github.com:$1.git; cd $(basename $1) }
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


# ESPIDF -----------------------------------------------------------------------

alias idf="idf.py build && idf.py -p /dev/cu.usbmodem1101 flash monitor"
alias idfg="source ~/Projects/espidf-builds/v5.1.5/esp-idf/export.sh"
alias idfb="idf.py build"
alias idff="idf.py -p /dev/cu.usbmodem1101 flash"
alias idfm="idf.py -p /dev/cu.usbmodem1101 monitor"
alias idfc="idf.py clean; rm -rf ./build ./main/build 2>/dev/null"
alias idfx="idf.py menuconfig"


# Hack Scripts -----------------------------------------------------------------

alias pinit=". $HACK_SCRIPTS/project_initialise.sh"

