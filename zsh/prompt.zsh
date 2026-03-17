
#- Prompt---------------------------------------------------------------------------------------
#- custom minimal shell prompt------------------------------------------------------------------

precmd() {
    [[ "${EUID}" -eq 0 ]] && prompeter="#" || prompeter="\$"

    local git_root
    git_root=$(git rev-parse --show-toplevel 2>/dev/null) || {
        PROMPT=$'\n  %F{12}%~%f\n%F{4}'"$prompeter"' %f'
            return
        }

    local rel="${${PWD:A}#${git_root:A}}"
    local project="${git_root:t}"

    local out
    out=$(LC_ALL=C git -c color.ui=false status --renames --ignore-submodules --untracked-files=all)

    # split once into lines (zsh-specific)
    local -a lines=("${(@f)out}")

    # branch from first non-empty line
    local branch=''
    for line in "${lines[@]}"; do
        [[ -z $line ]] && continue
        if [[ $line == "On branch "* ]]; then
            branch="${line#On branch }"
        elif [[ $line == "HEAD detached at "* ]]; then
            branch="(detached at ${line#HEAD detached at })"
        elif [[ $line == "HEAD detached from "* ]]; then
            branch="(detached from ${line#HEAD detached from })"
        else
            branch="(no branch)"
        fi
        break
    done

    # counts using zsh pattern matching 
    local modified deleted renamed added
    local modified=${#${(M)lines:#$'\t'modified:*}}
    local deleted=${#${(M)lines:#$'\t'deleted:*}}
    local renamed=${#${(M)lines:#$'\trenamed:'*}}
    local added=${#${(M)lines:#$'\t'new\ file:*}}

    # count untracked files section (each tabbed line in that block)
    local -i new=0
    local in_untracked=0
    for line in "${lines[@]}"; do
        if [[ $line == "Untracked files:"* ]]; then
            in_untracked=1
            continue
        fi
        if (( in_untracked )); then
            if [[ $line == $'\t'* ]]; then
                (( new++ ))
            elif [[ -n $line && $line != "("*")"* && $line != "  (use "* ]]; then
                # a non-indented, non-help line means we've left the untracked block
                in_untracked=0
            fi
        fi
    done

    # parts array
    local -a parts=()
    (( new      )) && parts+="󱅘 $new"
    (( added    )) && parts+=" $added"
    (( modified )) && parts+=" $modified"
    (( renamed  )) && parts+="󱦹 $renamed"
    (( deleted  )) && parts+=" $deleted"
    local parts_joined="${(j: :)parts}"

    PROMPT=$'\n'"%B  %F{1}${project}%b${rel} %F{7}on %F{2} %F{11}%B${branch}%b \
%F{2}${parts_joined}"$'\n%F{9}'"$prompeter"' %f'
}

