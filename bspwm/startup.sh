# sxhkd &
$DOTFILES/bspwm/mouseWarp.sh &
# picom --experimental-backends &
picom &
dbus-update-activation-environment --all # Idk what this does. something about the clipboard
# xsetroot -solid "#66bb00"
feh --bg-fill $DOTFILES/wallpapers/landscape2.png &
greenclip daemon &
$DOTFILES/bash/tabletSettings.sh &
# unclutter -idle 0.7 &
# xbanish &

bspc node -d "space-code"
firefox --no-remote -P default-release --class browser &

# sleep 2

kitty --class nvim bash -c '$DOTFILES/bspwm/tmuxInit.sh nvim' &
kitty --class term bash -c '$DOTFILES/bspwm/tmuxInit.sh term' &
# kitty --class system &
kitty --class system bash -lc 'btop --update 500; exec bash' &
# obsidian &
discord &
prismlauncher --class launcher &
# freetube &
# obs &
# firefox --no-remote -P github --class github https://github.com/undonecoffee?tab=repositories &
# firefox --no-remote -P school --class school https://wikipedia.org &
# firefox --no-remote -P ai --class ai https://gemini.google.com/u/0/app?pageId=none &
# firefox --no-remote -P music --class music https://music.youtube.com &

# firefox --no-remote -P testing         --class testing    http://localhost:5173/ &
# chromium --app=http://localhost:5173/  --name="testing" --class testing
