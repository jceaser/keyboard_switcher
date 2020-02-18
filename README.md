# Keyword Switcher
I'm to lazy to set my keyboard layout, can't something do it for me?

## Overview
A set of scripts to auto select the Keyboard Input Selector on the Macintosh based on which USB keyboard you have plugged in.

## Use Case

I'm a [dvorak](https://en.wikipedia.org/wiki/Dvorak_keyboard_layout) keyboard user who also has hardware based Dvorak keyboards but I don't want to have to constantly switch keyboard layouts to switch between the MacBook keyboard and my external.

## Setup
You need to know the name of your keyboard as it is advertised to the USB HID system. One way to do this on the Mac is to run `ioreg -p IOUSB` and then pick out your keyboard in the list. Try running the command both with and without your keyboard plugged in. For example you may see something like the following:

    | +-o Infinity_Ergodox/QMK@14274000  <class AppleUSBDevice, id 0x100061330, registered, matched, active, busy 0 (14 ms), retain 17>

From this the keyboard name can be found to be "Infinity_Ergodox".

## Use
Simple run the `read.sh` script in a terminal. This script is meant to run once and it will loop every 5 seconds. To configure a different keyboard then what is programed into the script, use the `-k` flag such as like this:

    watch bash read.sh -k Infinity_Ergodox

## Files

* get_keyboard.scpt - read the current keyboard
* read.sh - bash script to do all the work
* set_keyboard.scpt - set the keyboard using the GUI
* test scripts.scpt - will delete

## Future
* make cron friendly
* add help with a `-h` flag.
* 