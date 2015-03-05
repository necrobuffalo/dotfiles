#!/usr/bin/zsh

cecsvpn() {
    cd /home/taron/Downloads
    sudo openvpn --ca openvpn.cecs.pdx.edu.ca.cert.crt --config cecsvpn.ovpn
}

findme() {
    find / -name $1 2>/dev/null
    return 0
}


