
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
    if ! command -v idf.py &> /dev/null; then
        source ~/Projects/espidf-builds/v5.1.5/esp-idf/export.sh
    fi
    idf.py build &&
    idf.py -p "/dev/cu.usbmodem$1" flash &&
    idf.py -p "/dev/cu.usbmodem${2:-$1}" monitor
}

alias idfl="ls /dev/cu.*"
alias idfb='if ! command -v idf.py &> /dev/null; then
                source ~/Projects/espidf-builds/v5.1.5/esp-idf/export.sh;
            fi; idf.py build'
alias idff='if ! command -v idf.py &> /dev/null; then
                source ~/Projects/espidf-builds/v5.1.5/esp-idf/export.sh;
            fi; idf.py flash -p'
alias idfm='if ! command -v idf.py &> /dev/null; then
                source ~/Projects/espidf-builds/v5.1.5/esp-idf/export.sh;
            fi; idf.py monitor -p'
alias idfc='if ! command -v idf.py &> /dev/null; then
                source ~/Projects/espidf-builds/v5.1.5/esp-idf/export.sh;
            fi; idf.py fullclean; rm -rf ./build ./main/build 2>/dev/null'
alias idfx='if ! command -v idf.py &> /dev/null; then
                source ~/Projects/espidf-builds/v5.1.5/esp-idf/export.sh;
            fi; idf.py menuconfig'

hmonitor() {
    filename=$(date +"%d%m%H%M.txt");
    ./bin /dev/cu.usbmodem56E10136211 $1 "./analyse/data/$filename";

    pushd ./analyse > /dev/null;
    py ./analyse.py $(find ./data -type f -exec ls -lt {} + | head -n 1 | awk '{print $9}');
    popd > /dev/null
}

alias cpfirmware="cd main; mv ./build ../monke; cpcode . cpp h; mv ../monke ./build; cd .."


# Hack Scripts -------------------------------------------------------------------------------------

pinit() { $HACK_SCRIPTS/project_initialise.sh $@; cd "${1%.*}"; main }

alias pins='
    pushd "$(git rev-parse --show-toplevel 2>/dev/null || pwd)/main/include" > /dev/null 2>&1;
    rg "PIN";
    popd > /dev/null 2>&1;
'

