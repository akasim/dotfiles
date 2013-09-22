#!/bin/bash
for f in *.mp4
do
 echo "processing $f"
 /sbin/ffmpeg -i "$f"  -vn -b:a 256k -c:a libmp3lame "$f".mp3
 rm "$f"
 mv "$f".mp3 $"/Users/arif/Music/iTunes/iTunes Music/Automatically Add to iTunes/"
done
