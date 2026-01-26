eval "$(zoxide init bash)"
# xinput set-prop "Glorious Model O Wireless" "libinput Accel Speed" -0.37
# xinput set-prop $(xinput list --id-only "Glorious Model O Wireless" | head -n 1) "libinput Accel Speed" -0.37
for id in $(xinput list | grep "Glorious Model O Wireless" | sed -r 's/.*id=([0-9]+).*/\1/'); do
    xinput set-prop "$id" "libinput Accel Speed" -0.37 2>/dev/null
done
