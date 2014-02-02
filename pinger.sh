#!/bin/bash
# moncrypto.com

FILE="$1"
printf "Pinging servers. Please wait...\n\n"
(while read ADDRESS; do
    avg=$(ping -c 5 $ADDRESS | tail -1 | awk '{print $4}' | cut -d '/' -f 2)
    if [ "$avg" != "0" ] && [ "$avg" != "" ]
    then
            echo "$ADDRESS $avg"
    fi
done < "$FILE") | sort -t$' ' -nk2 | head -5
printf "\n\n"