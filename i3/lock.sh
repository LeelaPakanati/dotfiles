#! /bin/sh

a=`ls /home/lpakanati/Pictures/4KBackgrounds/*.png | shuf -n1`
i3lock -i $a -t -f -e 
