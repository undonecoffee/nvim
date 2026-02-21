# sxhkd &
$DOTFILES/bspwm/mouseWarp.sh &
# picom --experimental-backends &
picom &
xhost +local
# xsetroot -solid "#66bb00"
# feh --bg-fill $DOTFILES/wallpapers/landscape2.png &
$DOTFILES/bash/tabletSettings.sh &
# unclutter -idle 0.7 &
# xbanish &

bspc node -d "b-browser"
firefox --no-remote -P default-release --class browser &

# sleep 2

kitty --class nvim bash -c '$DOTFILES/bspwm/tmuxInit.sh nvim' &
kitty --class term bash -c '$DOTFILES/bspwm/tmuxInit.sh term' &
kitty --class music bash -lc 'btop --update 500; exec bash' &
obsidian &
freetube &
# obs &
firefox --no-remote -P ai --class ai https://gemini.google.com/u/1/app?pageId=none &
# firefox --no-remote -P github --class github https://github.com/undonecoffee?tab=repositories &
firefox --no-remote -P music --class music https://music.youtube.com &
# firefox --no-remote -P school --class school https://wikipedia.org &

# firefox --no-remote -P testing         --class testing    http://localhost:5173/ &
# chromium --app=http://localhost:5173/  --name="testing" --class testing
