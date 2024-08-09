
#- NAVIGATE --------------------------------------------------------------------
#- file processing and navigation ----------------------------------------------

# Faaster Navigate -------------------------------------------------------------

cdir() {
	mkdir $1 && cd $1
}

count() {
	ls $1 | wc -l | tr -d ' '
}

gt() {
    dir="${1:-.}"
    cd "$dir/$(
        find "$dir" -maxdepth 1 -mindepth 1 -type d |
        grep -o -E "[^/]*$" |
        sort |
        fzf --height=40% --border=rounded
    )"
}

of() {
    dir="${1:-.}"
	open "$dir/$(
		find "$dir/" -maxdepth 1 -type f |
		grep -o -E "[^/]*$" |
		sort |
		fzf --height=40% --border=rounded
	)"
}

alias p="gt ~/Projects"
alias uni="gt ~/Documents/Semester7"
alias docs="gt ~/Documents"
alias down="gt ~/Downloads"
alias conf="cd ~/.config/dotfiles"

