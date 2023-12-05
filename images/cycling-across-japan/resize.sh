#!/bin/bash
X=460   # pixels to trim from the top
Y=80   # pixels to trim from the bottom

directory="./"

for file in "$directory"/*route.mp4
do
    height=$(ffprobe -v error -select_streams v:0 -show_entries stream=height -of csv=p=0 "$file")
    let "new_height = $height - $X - $Y"

    outputfile=${file%.*}_trimmed.mp4  # set the output file name
    
    ffmpeg -y -i "$file" -vf "crop=in_w:${new_height}:0:${X}" -c:v libx264 -preset slow -crf 23 "$outputfile"
done

