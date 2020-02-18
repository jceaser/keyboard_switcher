#!/bin/bash

keyboard=Infinity_Ergodox
sleep_delay=5

work()
{
    while [ 1 ] ;
    do
        current_keyboard=$(osascript get_keyboard.scpt)
        has_keyboard=$(ioreg -p IOUSB | grep ${keyboard})
    
        if [ -z "$has_keyboard" ] ; then
            if [ "$current_keyboard" != "Dvorak - QWERTY ⌘" ] ; then
                osascript set_keyboard.scpt "Dvorak - QWERTY ⌘"
            fi
        else
            if [ "$current_keyboard" != "U.S." ] ; then
                osascript set_keyboard.scpt "U.S."
            fi
        fi
        sleep 5
    done
}

while getopts "k:s:" opt; do
    case $opt in
        k) keyboard=$OPTARG ;;
        s) sleep_delay=$OPTARG
    esac
done

work