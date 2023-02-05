#!/bin/bash
if [ "$(playerctl -p spotify status 2>/dev/null)" != "" ]; then 
    echo $(playerctl -p spotify metadata artist) "-" $(playerctl -p spotify metadata title)
else 
    echo "Not Playing"
fi