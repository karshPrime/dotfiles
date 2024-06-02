#!/usr/bin/env bash

error() {
    echo -e "\033[31mError: \033[0m$1"
    exit 1
}

# Check if an argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: ./install.sh <system>"
    error "No argument provided"
fi

create_symlinks() {
    local source_path=$1
    local remote_path="$HOME/.config"

    # Check if .config exists, if not create it
    if [ ! -d "$remote_path" ]; then
        mkdir -p "$remote_path"
    fi

    # Iterate over files and directories in source path
    for item in "$source_path"/*; do
        base_name=$(basename "$item")
        target="$remote_path/$base_name"

        # If target already exists, rename it to name.OLD
        if [ -e "$target" ]; then
            mv "$target" "$target.OLD"
        fi

        # Create symbolic link in remote_path
        ln -s "$item" "$target"
    done

    echo "System configured successfully."
}

case $1 in
    darwin)
        echo "Configuring Darwin"
        git sparse-checkout set darwin shared
        if [ $? -ne 0 ]; then
            error "Failed to configure git sparse-checkout for Darwin."
        fi
        create_symlinks ./darwin
        ;;

    server)
        echo "Configuring Server"
        git sparse-checkout set server shared
        if [ $? -ne 0 ]; then
            error "Failed to configure git sparse-checkout for Server."
        fi
        create_symlinks ./server
        ;;

    *)
        error "Unrecognized config $1"
        ;;
esac

