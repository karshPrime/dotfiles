
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


# Hack Scripts -------------------------------------------------------------------------------------

alias vic='vi ./src c h'
alias d=lazydocker

g() {
    [[ $# -eq 0 ]] && {
        git status -s --show-stash --ignore-submodule 2>/dev/null
    }|| git "$@"
}


alias pins='
    pushd "$(git rev-parse --show-toplevel 2>/dev/null || pwd)/main/include" > /dev/null 2>&1;
    rg --no-line-number "\#define.*_PIN\s+";
    popd > /dev/null 2>&1;
'

alias buildcl='
    pushd "$(git rev-parse --show-toplevel 2>/dev/null || pwd)" > /dev/null 2>&1;
    rm -rf ./build > /dev/null 2>&1;
    mkdir build;
    cd build;
    cmake ..;
    make;
    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..;
    popd > /dev/null 2>&1
'

alias pypush="deactivate; parent; python3 -m build && python3 -m twine upload ./dist/*"

alias findf="find . -type f -iname"

