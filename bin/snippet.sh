#!/bin/sh
for i in *ogg 
do  
	bn=`basename "$i" .ogg`
	ffmpeg -i "$i" -ss 25 -t 35 -ab 265k  "$bn"-snip.wav
	
	#hier ist die magie:
	sox "$bn"-snip.wav -C 256 "$bn"-snip-fade.wav gain -n -1 fade t 3 32 3
	
	lame --preset standard "$bn"-snip-fade.wav "$bn"-snippet.mp3
	rm "$bn"-snip.wav "$bn"-snip-fade.wav
done
