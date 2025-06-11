
#- NAVIGATE --------------------------------------------------------------------
#- file processing and navigation ----------------------------------------------

# Faaster Navigate -------------------------------------------------------------

cdir() {
	mkdir $1 && cd $1
}

alias rmwd='
    current=$(pwd);
    cd ..;
    rm -rf "$current";
'

count() {
	ls $1 | wc -l | tr -d ' '
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

# Function to run fzf with dynamic preview position
gt() {
	local dynamic_fzf() {
		local term_width=$(tput cols)

		if [ "$term_width" -lt 150 ]; then
			fzf --height=50% --border=rounded \
				--preview-window=down:70%:wrap \
				--preview="eza -T --color=always --icons=always -L 1 "$dir/{}""
		else
			fzf --height=40% --border=rounded \
				--preview-window=right:50%:wrap \
				--preview="eza -T --color=always --icons=always -L 1 "$dir/{}""
		fi
	}

    dir="${1:-.}"
    cd "$dir/$(
        find "$dir" -maxdepth 1 -mindepth 1 \( -type d -o -type l \) -not -path '*/.*' |
        grep -o -E "[^/]*$" |
        sort |
        dynamic_fzf
    )"
}

alias p="gt ~/Projects"
alias uni="gt ~/Documents/Semester7; gt"
alias docs="gt ~/Documents"
alias down="gt ~/Downloads"
alias astro="gt ~/Projects/AstroStreak"
alias conf="cd ~/.config/dotfiles"
alias vols="gt /Volumes/"

