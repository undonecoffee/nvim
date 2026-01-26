alias brs='source ~/.profile'
alias v='nvim'
alias e='exit'
alias keyboard='~/passwords/bash/firmware.sh'
alias tablet='~/passwords/bash/tabletSettings.sh'
alias pa='source venv/bin/activate'
alias py='python main.py'
alias gk='xclip -sel clip < ~/gotkey'
alias npms='cd ~/passwords/cameronwilcox/;npm run dev'
alias npmss='google-chrome --app=http://localhost:5173/  --name="testing" --class=testing & cd ~/passwords/cameronwilcox/; npm run dev'

vol() {
    pactl set-sink-volume @DEFAULT_SINK@ "$1%"
}
c() {
    bash $DOTFILES/setTheme.sh $1
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
    tmux ls >/dev/null 2>&1 && tmux attach || tmux
}
ts() {
    tmux switch-client -t "$1"
}
