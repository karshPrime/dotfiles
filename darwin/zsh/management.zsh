
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

alias tml="tmux ls"
alias tmK="tmux kill-session"
alias tmL="tmux ls | fzf --height=40% --border=rounded | cut -f 1 -d ':'"

tmk() { tmux kill-session -t $(tmL) }
tma() { tmux attach-session -t $(tmL) }

alias aedit="$EDITOR $DOTFILES/alacritty/alacritty.toml"

