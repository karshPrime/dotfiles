
# Prompt -------------------------------------------------------------------------------------------
# custom minimal shell prompt ----------------------------------------------------------------------

precmd() {
    [[ "${EUID}" -eq 0 ]] && prompeter="#" || prompeter="\$"

    local git_root
    git_root=$(git rev-parse --show-toplevel 2>/dev/null) || {
        PROMPT=$'\n  %F{12}%~%f\n%F{4}'"$prompeter"' %f'
            return
        }

    local rel="${${PWD:A}#${git_root:A}}"
    local project="${git_root:t}"
    local branch=$(git rev-parse --abbrev-ref HEAD)

    # Split git output status by lines into an array
    local -a status_lines=("${(@f)$(git status --porcelain=1 --renames --ignore-submodules)}")
    local -a parts=()
    local -i new=0 modified=0 deleted=0 added=0 renamed=0

    for line in "${status_lines[@]}"; do
        local x=${line[1,1]}
        local y=${line[2,2]}

        [[ $x == M   || $y == M   ]] && (( modified++ ))
        [[ $x == R   || $y == R   ]] && (( renamed++ ))
        [[ $x == '?' || $y == '?' ]] && (( new++ ))
        [[ $x == A   || $y == A   ]] && (( added++ ))
        [[ $x == D   || $y == D   ]] && (( deleted++ ))

    done

    (( new ))   && parts+="󱅘 $new"
    (( added )) && parts+=" $added"
    (( modified )) && parts+=" $modified"
    (( renamed ))  && parts+="󱦹 $renamed"
    (( deleted ))  && parts+=" $deleted"

    local parts_joined="${(j: :)parts}"

    
PROMPT=$'\n'"%B  %F{1}${project}%b${rel} %F{7}on %F{2} %F{11}%B${branch}%b \
%F{2}${parts_joined}"$'\n%F{9}'"$prompeter"' %f'


}

