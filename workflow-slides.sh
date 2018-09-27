#!/bin/bash

if [ -z $@ ]
then
    find ~/dev/workflow-slides/flows -type f -printf "%P\n" | sort 
else

    /home/havard/.nvm/versions/node/v8.9.0/bin/workflow --config ~/dev/workflow-slides/config.js $@ >~/.workflow/stdout &>~/.workflow/stderr &
fi
