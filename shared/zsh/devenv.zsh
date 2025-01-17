
#- DEVELOPMENT -------------------------------------------------------------------------------------
#- shortcuts for common dev actions ----------------------------------------------------------------

# Vim Shortcuts ------------------------------------------------------------------------------------

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


# Git Shortcuts ------------------------------------------------------------------------------------

gitg() {
    URL="git@github.com:$(echo $1 | cut -c 20-).git"
    git clone --depth=1 --recursive --verbose "$URL" $2
    cd "${2:-$(basename "$1")}"
}

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


# ESPIDF -------------------------------------------------------------------------------------------

idf() {
    idf.py build &&
    idf.py -p "/dev/cu.usbmodem$1" flash &&
    idf.py -p "/dev/cu.usbmodem${2:-$1}" monitor
}

alias idfl="ls /dev/cu.*"
alias idfg="source ~/Projects/espidf-builds/v5.1.5/esp-idf/export.sh"
alias idfb="idf.py build"
alias idff="idf.py flash -p"
alias idfm="idf.py monitor -p"
alias idfc="idf.py fullclean; rm -rf ./build ./main/build 2>/dev/null"
alias idfx="idf.py menuconfig"


# Hack Scripts -------------------------------------------------------------------------------------

alias pinit=". $HACK_SCRIPTS/project_initialise.sh"

alias pins='
    pushd "$(git rev-parse --show-toplevel 2>/dev/null || pwd)/main/include" > /dev/null 2>&1;
    rg "PIN";
    popd > /dev/null 2>&1;
'

