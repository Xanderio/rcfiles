xmodmap /home/asieg/.Xmodmap &

compton --config ~/.compton.config -b

dunst &

urxvtd --quiet --opendisplay --fork

secret-tool lookup gpg alex@xanderio.de | \
    gpg2 --batch --yes\
	 --passphrase-fd 0 -q\
	 -d /home/asieg/.authinfo.gpg > /dev/null &

exec xmonad

