
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


# Hack Scripts -------------------------------------------------------------------------------------

alias vic='vi ./src ./include c h'

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

alias systemctl="brew services"

