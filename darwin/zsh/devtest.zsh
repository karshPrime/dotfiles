
#- DevTest----------------------------------------------------------------------
#- plugin to create quick test directories with specified language template ----

# Path for project_initialise script
# gh:karshPrime/SysHacks/blob/main/project_initialise.sh
PROJ_INIT="$HACK_SCRIPTS/project_initialise.sh"

# Find the last test directory
tst() {
	# if argument is a number, check if that indexed test dir already exists
	# if it does exist then move there
	if [[ "$1" =~ ^[0-9]+$ ]]; then
		target="/tmp/test${1}"

		if [ -d "$target" ]; then
			cd "$target" || return
			return
		else
			echo "Directory $target does not exist."
			return 1
		fi
    fi

	# find existing biggest test<NUM> dir
	highest=$(
		find /tmp/ -maxdepth 1 -type d -name "test*" |
		grep -o '[0-9]*$' |
		sort -n |
		tail -1
	)

	# if no directory found, set the highest to 0
	if [ -z "$highest" ]; then
		highest=0
	fi

	# increment the highest directory number
	next=$((highest + 1))

	# trigger project init script
	if [ -n "$1" ]; then
		$PROJ_INIT "test${next}.$1"
		mv "./test${next}" /tmp/
	else
		mkdir "/tmp/test${next}"
	fi

	cd "/tmp/test${next}/"
}

# Delete all test directies with self remove utility
tstrm() {
    local cwd=$(pwd)

    if [[ $cwd == /tmp/test* ]]; then
        cd ~
    fi

	mr /tmp/test*
}

