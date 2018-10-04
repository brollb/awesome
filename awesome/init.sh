[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xset -b
xmodmap ~/.speedswapper

# for auto color adjustment based on the time
pkill redshift
pkill cbatticon
pkill nm-applet
redshift &
cbatticon &
nm-applet &
