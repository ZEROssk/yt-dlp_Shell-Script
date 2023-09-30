#!/bin/bash

read -p "URL: " URL
while :
do
	read -p "Please Type Format (mp3/mp4/all): " F
	if [ "$F" = "mp3" ]; then
		echo "MP3 Download"
		yt-dlp -o "%(title)s.%(ext)s" -x --audio-format mp3 "$URL"
		break
	elif [ "$F" = "mp4" ]; then
		echo "MP4 Download"
		yt-dlp -o "%(title)s.%(ext)s" -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" --embed-thumbnail "$URL"
		break
	elif [ "$F" = "all" ]; then
		echo "MP3 & MP4 Download"
		yt-dlp -o "%(title)s.%(ext)s" -x --audio-format mp3 "$URL"
		yt-dlp -o "%(title)s.%(ext)s" -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" --embed-thumbnail "$URL"
		break
	else
		echo "Please Type [mp3:mp4:all]"
	fi
done

