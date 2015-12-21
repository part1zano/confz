setxkbmap -option grp:caps_toggle -option compose:rctrl -option terminate:ctrl_alt_bksp -option nbsp:level2 us,ru
xset b 0
xset fp+ /usr/local/share/fonts/Droid
xset fp+ /usr/local/share/fonts/ubuntu-font
xset fp+ /home/che/.fonts/aller
xset fp+ /home/che/.fonts/consolas
xset fp+ /home/che/.fonts/inconsolata
xset fp+ /home/che/.fonts/hack
xset fp rehash

eval `ssh-agent`

exec wmii
#exec i3

ssh-agent -k
