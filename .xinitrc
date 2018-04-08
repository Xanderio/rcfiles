setxkdbmap -option caps:escape
xset m 4 1 
compton --config ~/.compton.config -b
dunst &
sh /usr/home/asieg/.fehbg
secret-tool lookup gpg alex@xanderio.de | \
    gpg2 --batch --yes\
	 --passphrase-fd 0 -q\
	 -d /home/asieg/.authinfo.gpg > /dev/null &
redshift &
exec xmonad
