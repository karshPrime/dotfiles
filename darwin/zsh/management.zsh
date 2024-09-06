
#- MANAGEMENT ------------------------------------------------------------------
#- manage configurations -------------------------------------------------------

# Neovim -----------------------------------------------------------------------

nedit() {
    pushd $DOTFILES/nvim/lua/ > /dev/null;
	vi lua .
    popd > /dev/null
}


# ZSH --------------------------------------------------------------------------

zedit() {
    pushd $DOTFILES/zsh > /dev/null;
	vi .
    popd > /dev/null
}

alias zupdate="source ~/.zshrc"
alias ztime="time zsh -i -c exit"


# TMux -------------------------------------------------------------------------

alias tedit="$EDITOR $DOTFILES/tmux/tmux.conf"
alias tupdate="tmux source-file $DOTFILES/tmux/tmux.conf"

alias tmK="tmux kill-session"
alias TML="tmux ls | fzf --height=40% --border=rounded | cut -f 1 -d ':' 2>/dev/null"

tmk() { tmux kill-session -t $(TML) }
tma() { tmux ls >/dev/null && tmux attach-session -t $(TML) 2>/dev/null }

alias aedit="$EDITOR $DOTFILES/alacritty/alacritty.toml"

