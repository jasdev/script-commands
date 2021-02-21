#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title YouTube rip and quick open
# @raycast.mode silent
# @raycast.packageName Music

# Optional parameters:
# @raycast.icon 💿
# @raycast.argument1 { "type": "text", "placeholder": "URL (or Pasteboard)", "optional": true }

# Documentation:
# @raycast.description Rips an .mp3 of a YouTube URL to a directory and opens with your app. of choice (defaults to QuickTime Player).
# @raycast.author Jasdev Singh
# @raycast.authorURL https://jasdev.me

url=${1}

if [ -z "$url" ]
then
	url="$(pbpaste)"
fi

application_name="QuickTime Player"
destination_folder="~/Downloads"

youtube-dl -x "$url" --audio-format "mp3" -o "$destination_folder/%(title)s.%(ext)s" --exec "open -a \"$application_name\" {}"
afplay /System/Library/Sounds/Funk.aiff