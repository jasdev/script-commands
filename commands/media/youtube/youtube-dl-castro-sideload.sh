#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Castro Sideload
# @raycast.mode silent
# @raycast.packageName Music

# Optional parameters:
# @raycast.icon 💿
# @raycast.argument1 { "type": "text", "placeholder": "YouTube URL (or Pasteboard)", "optional": true }

# Documentation:
# @raycast.description Rips an .mp3 of a YouTube URL and places it in your Castro Sideloads folder.
# @raycast.author Jasdev Singh
# @raycast.authorURL https://jasdev.me

url=${1}

if [ -z "$url" ]
then
	url="$(pbpaste)"
fi

castro_sideloads_folder="~/Library/Mobile Documents/iCloud~co~supertop~castro/Documents/Sideloads"

youtube-dl -x "$url" --audio-format "mp3" -o "$castro_sideloads_folder/%(title)s.%(ext)s"
afplay /System/Library/Sounds/Funk.aiff