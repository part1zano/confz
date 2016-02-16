setxkbmap -option grp:caps_toggle -option compose:rctrl -option terminate:ctrl_alt_bksp
xset b 0
xset fp+ /usr/local/share/fonts/Droid
xset fp+ /usr/local/share/fonts/ubuntu-font
xset fp+ /home/che/.fonts/aller
xset fp+ /home/che/.fonts/consolas
xset fp+ /home/che/.fonts/inconsolata
xset fp+ /home/che/.fonts/hack
xset fp+ /home/che/.fonts/font-awesome
xset fp rehash

xidle -delay 60 -program "i3lock -c 222222"

exec ssh-agent i3

