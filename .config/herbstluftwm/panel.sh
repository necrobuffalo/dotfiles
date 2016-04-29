#!/bin/bash

# disable path name expansion or * will be expanded in the line
# cmd=( $line )
set -f

monitor=${1:-0}
geometry=( $(herbstclient monitor_rect "$monitor") )
if [ -z "$geometry" ] ;then
    echo "Invalid monitor $monitor"
    exit 1
fi
# geometry has the format: WxH+X+Y
x=${geometry[0]}
y=${geometry[1]}
panel_width=${geometry[2]}
panel_height=20
font="Hack-8"
bgcolor=$(herbstclient get frame_border_normal_color)
selbg=$(herbstclient get window_border_active_color)
selfg='#101010'

#####
## Try to find textwidth binary.
## In e.g. Ubuntu, this is named dzen2-textwidth.
#if [ -e "$(which textwidth 2> /dev/null)" ] ; then
#    textwidth="textwidth";
#elif [ -e "$(which dzen2-textwidth 2> /dev/null)" ] ; then
#    textwidth="dzen2-textwidth";
#else
#    echo "This script requires the textwidth tool of the dzen2 project."
#    exit 1
#fi
####
# true if we are using the svn version of dzen2
function uniq_linebuffered() {
    awk '$0 != l { print ; l=$0 ; fflush(); }' "$@"
}

herbstclient pad $monitor $panel_height
{
    # events:
    #mpc idleloop player &
    while true ; do
        date +'date %{F#efefef}%H:%M%{F#909090}, %Y-%m-%{F#efefef}%d'
        sleep 1 || break
    done > >(uniq_linebuffered)  &
    childpid=$!
    herbstclient --idle
    kill $childpid
} 2> /dev/null | {
    TAGS=( $(herbstclient tag_status $monitor) )
    date=""
    windowtitle=""
    while true ; do
        bordercolor="#26221C"
        separator="%{B-}%{F$selbg}|"
        # draw tags
        for i in "${TAGS[@]}" ; do
            case ${i:0:1} in
                '#')
                    echo -n "%{B$selbg}%{F$selfg}"
                    ;;
                '+')
                    echo -n "%{B#9CA668}%{F#141414}"
                    ;;
                ':')
                    echo -n "%{B-}%{F#ffffff}"
                    ;;
                '!')
                    echo -n "%{B#FF0675}%{F#141414}"
                    ;;
                *)
                    echo -n "%{B-}%{F#ababab}"
                    ;;
            esac
            echo -n " ${i:1} "
        done
        echo -n "$separator"
        echo -n "%{B-}%{F-}%{c} ${windowtitle//^/^^}"
        # small adjustments
        right="$separator%{B-} $date $separator"
        right_text_only=$(echo -n "$right"|sed 's.\^[^(]*([^)]*)..g')
        echo -n "%{r}$right"
        echo
        # wait for next event
        read line || break
        cmd=( $line )
        # find out event origin
        case "${cmd[0]}" in
            tag*)
                #echo "reseting tags" >&2
                TAGS=( $(herbstclient tag_status $monitor) )
                ;;
            date)
                #echo "reseting date" >&2
                date="${cmd[@]:1}"
                ;;
            quit_panel)
                exit
                ;;
            reload)
                exit
                ;;
            focus_changed|window_title_changed)
                windowtitle="${cmd[@]:2}"
                ;;
            #player)
            #    ;;
        esac
        done
} 2> /dev/null | lemonbar -g ${panel_width}x${panel_height}+$x+$y -f "$font" \
    -B "$bgcolor" -F '#efefef' &

sleep 2
pkill stalonetray
stalonetray
