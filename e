#!/bin/bash

i3-msg "split vertical; layout stacking"
    
if [[ $(pgrep emacs) ]]; then
   emacsclient -c $1 
else
   emacs $1 
fi

i3-msg "layout default"
