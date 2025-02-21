
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
alias TML="tmux ls | fzf --height=30% --border=rounded | cut -f 1 -d ':' 2>/dev/null"

tmk() { tmux kill-session -t $(TML) }
tm() {
    tmux info >/dev/null 2>&1 && {
        echo "Sessions Switch"
        session=$(TML);

        if [ -n "$session" ]; then
            tmux switch-client -t "$session";
        fi

        return
    }

    tmux ls >/dev/null 2>&1 && {
        echo "Session Connect"
        tmux attach-session -t $(TML) 2>/dev/null
    } || {
        echo "Session Create"
        tmux
    }
}


# Alacritty --------------------------------------------------------------------

alias aedit="$EDITOR $DOTFILES/alacritty/alacritty.toml"

