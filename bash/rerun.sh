rerun() {
    case "$1" in
    "")
        firefox --no-remote -P ai --class ai https://gemini.google.com &
        firefox --no-remote -P github --class github https://github.com/undonecoffee?tab=repositories &
        firefox --no-remote -P music --class music https://music.youtube.com &
        firefox --no-remote -P school --class school https://desmos.com/calculator &
        firefox --no-remote -P default-release --class browser &
        disown
        ;;
    "firefox" | "b" | "browser" | "default")
        firefox --no-remote -P default-release --class browser &
        disown
        ;;
    "ai")
        firefox --no-remote -P ai --class ai https://gemini.google.com &
        disown
        ;;
    "sxhkd")
        pkill sxhkd
        sxhkd &
        disown
        ;;
    "git" | "github" | "g")
        firefox --no-remote -P github --class github https://github.com/undonecoffee?tab=repositories &
        disown
        ;;
    "test")
        firefox --no-remote -P testing --class testing http://localhost:5173 &
        disown
        ;;
    "yt" | "music" | "m")
        firefox --no-remote -P music --class music https://music.youtube.com &
        disown
        ;;
    "school" | "s")
        firefox --no-remote -P school --class school https://dictionary.com &
        disown
        ;;
    esac
}
