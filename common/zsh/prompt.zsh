
# Prompt -------------------------------------------------------------------------------------------
# custom minimal shell prompt ----------------------------------------------------------------------

precmd() {
  local git_root
  git_root=$(git rev-parse --show-toplevel 2>/dev/null) || {
    PROMPT=$'\n  %F{12}%~%f\n%F{4}$ %f'
    return
  }

  local rel="${${PWD:A}#${git_root:A}}"
  local project="${git_root:t}"
  local branch=$(git branch --show-current)

  PROMPT=$'\n%B  %F{1}'"$project"$'%b'"$rel"$' %F{7}on %F{2} %F{11}%B'"$branch"$'%b%f\n%F{9}$ %f'
}

