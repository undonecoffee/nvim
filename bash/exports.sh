export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
export PATH="$HOME/.local/kitty.app/bin:$PATH"
export DOTFILES="$HOME/passwords/dotfiles"
export BROWSER="firefox --no-remote -P default-release --class browser"

# If inside tmux, update the local shell's XAUTHORITY from the tmux global env
if [ -n "$TMUX" ]; then
    export XAUTHORITY=$(tmux show-env | grep ^XAUTHORITY | cut -d= -f2)
    export DISPLAY=$(tmux show-env | grep ^DISPLAY | cut -d= -f2)
fi
