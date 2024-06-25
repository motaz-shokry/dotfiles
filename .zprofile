doas echo s2idle | doas tee /sys/power/mem_sleep
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
       Hyprland 
fi

# vars
export PATH=$PATH:/home/$USER/.local/bin
export EDITOR="vim"
export BROWSER="brave"
export TERM="alacritty"
export TERMINAL="alacritty"

# esc to caps
loadkeys $HOME/.config/loadkeys/loadkeysrc

