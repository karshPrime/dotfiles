
#- DEVELOPMENT -------------------------------------------------------------------------------------
#- shortcuts for common dev actions ----------------------------------------------------------------

# Vim Shortcuts ------------------------------------------------------------------------------------

v() {
    local n=$(( $(tput cols 2>/dev/null || echo 0) / 100 ))
    (( n < 1 )) && n=1
    (( ${FILE_COUNT:-$#} < n )) && n=${FILE_COUNT:-$#}
    "$EDITOR" -O"$n" -- "$@"
}

alias sv="sudo $EDITOR"
alias vic='vi ./src c h'


# Hack Scripts -------------------------------------------------------------------------------------

alias d=lazydocker
alias g=git
alias G='git status -s --show-stash --ignore-submodule 2> /dev/null'

alias pins='
    pushd "$(git rev-parse --show-toplevel 2>/dev/null || pwd)/main/include" > /dev/null 2>&1;
    rg --no-line-number "\#define.*_PIN\s+";
    popd > /dev/null 2>&1;
'

alias findf="find . -type f -iname"

alias cupdate='find . -maxdepth 1 -type f -iname ".copier-*-answers.yml" \
        -exec copier update --defaults --answers-file {} \;'

