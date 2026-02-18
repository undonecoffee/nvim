#!/bin/bash

# Configuration
FINAL="$HOME/passwords/dotfiles"

symlink() {
    local src="$1"
    local dest="$2"
    local backup="${dest}-backup"

    echo "--- Processing: $dest ---"

    # Make sure source exists
    if [ ! -e "$src" ]; then
        echo -e "ERROR: '$src' does not exist\n"
        return 1
    fi

    # If there is already a symlink, remove it to refresh
    if [ -L "$dest" ]; then
        echo "INFO: Removing existing symlink at $dest"
        rm "$dest"
    fi

    # 3. Conflict & Backup Handling:
    if [ -e "$dest" ]; then
        if [ -e "$backup" ]; then
            echo -e "ERROR: $dest exists AND $backup already exists. Manual intervention required to prevent overwrite.\n"
            return 1
        else
            mv "$dest" "$backup"
            echo "SUCCESS: Backed up $dest to $backup"
        fi
    fi

    # 4. Action: Create the new symlink
    ln -s "$src" "$dest"
    echo -e "SUCCESS: Linked $dest -> $src\n"
}

# --- Execution ---
echo -e "Starting dotfiles setup...\n"

# Ensure target directories exist before linking
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.mozilla/firefox/or2e7lin.default-release/chrome"
mkdir -p "$HOME/passwords/documentation/obsidian"

# Test Cases / Operations
symlink "$FINAL/nvim" "$HOME/.config/nvim"
symlink "$FINAL/sxhkd" "$HOME/.config/sxhkd"
symlink "$FINAL/bspwm" "$HOME/.config/bspwm"
symlink "$FINAL/kitty" "$HOME/.config/kitty"
symlink "$FINAL/tmux" "$HOME/.config/tmux"
symlink "$FINAL/yazi" "$HOME/.config/yazi"
symlink "$FINAL/picom" "$HOME/.config/picom"

# Somewhat unique locations
symlink "$FINAL/firefox.css" "$HOME/.mozilla/firefox/or2e7lin.default-release/chrome/userChrome.css"
symlink "$FINAL/obsidian" "$HOME/passwords/documentation/obsidian/.obsidian"

echo "--- DONE ---"
