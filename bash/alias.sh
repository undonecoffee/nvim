alias brs='source ~/.profile'
alias v='nvim'
alias e='exit'
alias keyboard='~/passwords/bash/firmware.sh'
alias tablet='$DOTFILES/bash/tabletSettings.sh'
alias pa='source .venv/bin/activate'
alias py='python main.py'
alias cs='rm -rf ~/.local/state/nvim/swap/*'
alias npms='cd ~/passwords/cameronwilcox/;npm run dev'
alias npmss='google-chrome --app=http://localhost:5173/  --name="testing" --class=testing & cd ~/passwords/cameronwilcox/; npm run dev'
alias fixTmux='export XAUTHORITY=$(tmux show-env | grep ^XAUTHORITY | cut -d= -f2); export DISPLAY=$(tmux show-env | grep ^DISPLAY | cut -d= -f2)'

vol() {
    pactl set-sink-volume @DEFAULT_SINK@ "$1%"
}
sxhkdrs() {
    pkill sxhkd
    sxhkd &
    disown
}
gc() {
    echo -e "\ncloning $1/$2\n"
    git clone "https://github.com/$1/$2"
}
t() {
    if [ -n "$1" ]; then
        $DOTFILES/bspwm/tmuxInit.sh $1
    else
        tmux ls >/dev/null 2>&1 && tmux attach || tmux
    fi
}
ts() {
    tmux switch-client -t "$1"
}
# c() {
#     bash $DOTFILES/setTheme.sh $1
# }
