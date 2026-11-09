#!/usr/bin/env bash

set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES"

backup_file() {
    local target="$1"

    if [ -e "$target" ] && [ ! -L "$target" ]; then
        local backup="$target.backup"
        local number=1
        while [ -e "$backup" ] || [ -L "$backup" ]; do
            backup="$target.backup.$number"
            number=$((number + 1))
        done
        mv "$target" "$backup"
        echo "Backed up $target to $backup"
    fi
}

backup_file "$HOME/.bashrc"
backup_file "$HOME/.tmux.conf"

ln -sfn "$DOTFILES/bashrc" "$HOME/.bashrc"
ln -sfn "$DOTFILES/tmux.conf" "$HOME/.tmux.conf"

echo "Dotfiles installed successfully."
echo "Run: source ~/.bashrc"
