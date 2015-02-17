#!/usr/bin/zsh

findme() {
    find / -name $1 2>/dev/null
    return 0
}


