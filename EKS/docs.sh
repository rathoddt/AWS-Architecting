#!/bin/bash

filename='README.md'

while read p; do 

    first_char=`echo $p | cut -c 1`

    l1='# `'
    l2=' '
    for $first_char in $l1; do
       echo $first_char
    done
    # case "$first_char" in
    # *!'`'* ) echo "do something #1";;
    # *!'#'* ) echo "do something # 2";;
    # *!' '* ) echo "do something # 2";;
    # * ) echo "Do some thing";;
    # esac

done < "$filename"