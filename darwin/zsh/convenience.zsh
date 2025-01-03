
#- SHORTCUTS -------------------------------------------------------------------
#- aliases and keybinds --------------------------------------------------------

# Keybinds
bindkey -s '^[c' ' | pbcopy\n'      # copy output to clipboard
bindkey -s '^[p' 'pbpaste > '       # paste clipboard content to a file
bindkey -s '^[n' ' | wc -l\n'       # count (Number of) results

# Default Behaviour
alias cp=ditto
alias df='df -h'
alias diff='diff --color='always''
alias clx='clx --no-less-verify'
alias ed='ed -p "> "'
alias re='grep -o -E'
alias sed='sed -r'

# Common Actions
alias x=exit
alias assem="objdump -M intel -D"
alias weather='curl wttr.in/melbourne'
alias path="echo $PATH | tr ':' '\n'"
alias rmf='
	find . -maxdepth 1 -mindepth 1 |
	sort |
	fzf -m --height=40% --border=rounded |
	sed "s/ /\\\ /g" |
	xargs $HACK_SCRIPTS/trash.sh
'

# List Files
alias l='eza -lag --color=always --group-directories-first --icons'
alias ls='eza -g --icons'
alias la='eza -a --color=always --group-directories-first --icons'
alias tree='eza -T --group-directories-first --icons=always -L'
alias treg='eza -T --group-directories-first --icons=always --git-ignore -L'

# Easier Calls
alias c='bat -n'
alias cat='bat -pp'
alias htop=btop
alias ntop='sudo bandwhich'
alias gr='./gradlew'
alias pip='python3 -m pip'
alias py=python3
alias python=python3

# Media Control
alias yt='yt-dlp'
alias ytvb='yt-dlp -q -f bestvideo -o "~/Videos/offlineYT/%(title)s.%(ext)s"'
alias ytab='yt-dlp -q -f bestaudio -o "~/Music/offlineYT/%(title)s.%(ext)s"'
alias ytvs="yt-dlp -q -f 'bv*/+size' -o '~/Videos/offlineYT/%(title)s.%(ext)s'"
alias ytas="yt-dlp -q -f 'ba*/+size' -o '~/Music/offlineYT/%(title)s.%(ext)s'"
alias spotfix='bash <(curl -sSL https://spotx-official.github.io/run.sh)'

# Fixed Path
i() { c ~/Documents/Info/$1 }

