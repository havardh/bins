#!/bin/bash

if [ -z $@ ]
then
    find ~/.workflow/flows -type f -printf "%P\n"
else

    /home/havard/.nvm/versions/node/v8.9.0/bin/workflow $@ >~/.workflow/stdout &>~/.workflow/stderr &
fi
