#!/usr/bin/zsh

############################################################
# General functions
############################################################
colours() {
     for i in {0..255} ; do
         printf "\x1b[38;5;${i}m${i} "
     done
}

findme() {
    find / -name $1 2>/dev/null
    return $?
}

fixkb() {
    setxkbmap -option ctrl:nocaps
}

############################################################
# MCECS-related functions
############################################################
cecsvpn() {
    sudo openvpn --config /home/taron/Downloads/cecsvpn.ovpn --ping 60 --ping-restart 360 --persist-remote-ip --daemon
}

kickvpn() {
    sudo kill -HUP $(pgrep openvpn)
}

###########################################################
# Silly things for fun
############################################################
findsock() {
    netcat -U $(find $1 -type s 2>/dev/null | shuf -n 1)
    return $?
}
