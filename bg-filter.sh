#!/bin/bash

dirs=$@
if [ $# -eq 0 ]
  then
    dirs=$PWD
fi

for dir in $dirs
do
    for img in $dir/*
    do
        if [ -d "${img}" ]; then
            echo "$img is a directory, skipping"
            continue
        fi
    
        height=`sips -g pixelHeight "$img"`
        height="${height##* }"
        width=`sips -g pixelWidth "$img"`
        width="${width##* }"
        
        if((height < 1080))||((width < 1920))||((width <= height)); then
            echo "rm'ing ($width x $height) $img"
            `rm "$img"`
        fi
    done
done