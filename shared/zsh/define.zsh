
#- DEFINE ----------------------------------------------------------------------
#- exports & plugins -----------------------------------------------------------

# Initialise -------------------------------------------------------------------

# ZSH history
HISTFILE="$HOME/.config/zsh/histfile"
HISTSIZE=5000
SAVEHIST=5000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS

# cd into directories without cd
setopt autocd extendedglob

# Better auto-complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload -Uz compinit
compinit -C "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

# Fetch when not in TMux
[[ -z "$TMUX" ]] && bash ~/.config/fetch.sh


# Explicit Declaration ---------------------------------------------------------

# Save path for go packages
export GOPATH=$HOME/.local/share/go
export FZF_DEFAULT_OPTS="-i --cycle --ansi --color=dark --layout=reverse\
	--pointer='▶ ' --prompt='  '"
export FZF_DEFAULT_COMMAND='find . -maxdepth 1 ! -path "*git*"'

export GPG_TTY=$(tty)
gpgconf --launch gpg-agent


# Integrations -----------------------------------------------------------------

# Starship Prompt
eval "$(starship init zsh)"

# fzf 
eval "$(fzf --zsh)"

# Plugins
source "$HOME/.config/zsh/highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.config/zsh/autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.config/zsh/history/zsh-history-substring-search.zsh"
source "$HOME/.config/zsh/karSH/devedit.zsh"
source "$HOME/.config/zsh/karSH/benches.zsh"

# Updated defaults behaviour
bindkey "^[l"     clear-screen
bindkey '^[[1;9D' backward-word
bindkey '^[[1;9C' forward-word
bindkey '^[[3~'   delete-char
bindkey '^[[1;9B' backward-kill-word
bindkey '^[[3;5~' kill-word

bindkey '^[[1;3D' beginning-of-line
bindkey '^[[1;3C' end-of-line

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Other Configs
source "$HOME/.config/dotfiles/shared/zsh/navigations.zsh"  # file processing
source "$HOME/.config/dotfiles/shared/zsh/management.zsh"   # manage config files
source "$HOME/.config/dotfiles/shared/zsh/convenience.zsh"  # aliases & keybinds
source "$HOME/.config/dotfiles/shared/zsh/devenv.zsh"       # development shortcuts
source "$HOME/.config/dotfiles/shared/zsh/hacks.zsh"        # :)

