
#- DevEdit----------------------------------------------------------------------
#- plugin to quick edit project files irrespective of language -----------------

# helper functions -------------------------------------------------------------

exit_if_not_git_repo() {
	if ! git rev-parse --is-inside-work-tree &> /dev/null; then
		echo -e "\e[31mError: \e[0mThis action requires the project to be within a git repo."
		return 1
	fi
}

open_file_if_exists() {
	if [ -f "$1" ]; then
		$EDITOR "$1"
	else
		echo -e "\e[31mError: \e[0mFile not found: $1"
	fi
}


# calls ------------------------------------------------------------------------

# Edit README
readme() {
	exit_if_not_git_repo || return
	PROJECT_NAME=$(git rev-parse --show-toplevel)
	README_FILE=$(ls "$PROJECT_NAME"/README* 2>/dev/null)

	if [ -z "$README_FILE" ]; then
		echo -e "\e[31mError: \e[0mNo README file found."
	else
		open_file_if_exists "$README_FILE"
	fi
}

# Edit Makefile
makefile() {
	exit_if_not_git_repo || return
	PROJECT_NAME=$(git rev-parse --show-toplevel)

	open_file_if_exists "$PROJECT_NAME/Makefile"
}

# Edit .git/config
gignore() {
	exit_if_not_git_repo || return
	PROJECT_NAME=$(git rev-parse --show-toplevel)

	open_file_if_exists "$PROJECT_NAME/.git/config"
}

# Edit main.x
main() {
	exit_if_not_git_repo || return
	PROJECT_NAME=$(git rev-parse --show-toplevel)

	MAIN_FILE=$(git ls-files "$PROJECT_NAME" | grep -i 'main')

	if [ -z "$MAIN_FILE" ]; then
		echo -e "\e[31mError: \e[0mNo main file found."
	else
		open_file_if_exists "$MAIN_FILE"
	fi
}

# cd to project root
parent() {
	exit_if_not_git_repo || return
	PROJECT_NAME=$(git rev-parse --show-toplevel)

	cd "$PROJECT_NAME"
}

# Vim Interactive
vi() {
    exit_if_not_git_repo || return
    pushd "$(git rev-parse --show-toplevel)" > /dev/null

    CONDITIONS=()

    # construct find conditions based on arguments
    for ARG in "$@"; do
        if [ "$ARG" = "." ]; then
			popd > /dev/null
			pushd . > /dev/null
        else
            CONDITIONS+=("-iname" "*.$ARG" "-o")
        fi
    done

    # remove trailing '-o' if present
    if [ ${#CONDITIONS[@]} -gt 0 ]; then
        if [ "${CONDITIONS[-1]}" = "-o" ]; then
            CONDITIONS=("${CONDITIONS[@]:0:${#CONDITIONS[@]}-1}")
        fi
		# find files based on constructed conditions, excluding .git directory
        FILES=$(find "." -type f \( "${CONDITIONS[@]}" \) -not -path '*/.git/*')
    else
        FILES=$(find "." -type f -not -path '*/.git/*')
    fi

    # use fzf to select files, displaying with bat
    FILES_CMD=$(
		echo "$FILES" |
        fzf -m --preview="bat --color=always --number {}"
	)

    # open the selected files in the editor
    if [ -n "$FILES_CMD" ]; then
        $EDITOR $(echo "$FILES_CMD")
    else
        echo "No files selected."
    fi
	popd > /dev/null
}

