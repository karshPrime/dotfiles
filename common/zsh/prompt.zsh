precmd() {
    if local git_root=$(git rev-parse --show-toplevel 2>/dev/null)
    
    if [[ -n $git_root ]]; then
        local project_name=${git_root:t}
        local relative_path=${PWD#$git_root}
        local branch_name=$(git branch --show-current)

    PROMPT="
  %F{1}%B$project_name%b$relative_path %F{7}on %F{2} %F{11}%B$branch_name%b%f
%F{9}$ "

    else
    PROMPT="
  %F{12}%~%f
%F{4}$ "

    fi

${currentpath}
}

