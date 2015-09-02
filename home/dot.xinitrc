setxkbmap -option grp:caps_toggle -option compose:rctrl -option terminate:ctrl_alt_bksp us,ru
xset b 0
xset fp+ /usr/local/share/fonts/Droid
xset fp+ /usr/local/share/fonts/ubuntu-font
xset fp rehash

eval `ssh-agent`

exec wmii

ssh-agent -k
