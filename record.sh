#!/bin/bash
# recordCam.sh
# ------------
# This script saves the live video from the Foscam IP camera to a full-quality mp4 file.
# I chose to split the files every 15 minutes (900 seconds), to quickly find the time I need.
# Note: audio is not saved as my cameras don't have a microphone connected to them.
# -----------
# Author: @LucaTNT
# License: BSD

# Uncomment this line if you're having trouble with zero-sized files (tipically happens on low end cameras), thanks Eric! (https://lucatnt.com/2014/08/record-and-archive-video-from-ip-cameras/#comment-48019)
# killall -INT ffmpeg


# The file name. I use the date to make finding files easier.
name="`date +%Y-%m-%d_%H.%M`"

# Where the videos will be saved
BASEpath='{{video_record_home_dir}}'
RECpath=$BASEpath'/video'

# Save the streams using ffmpeg at 30 fps, stopping the capture after 900 seconds (15 minutes). Add more lines if you have more than 2 cameras
ffmpeg -i rtsp://192.168.1.21:554/unicast -r 30 -b:v 1k -vcodec copy  -t 900 $RECpath/family_room_$name.mp4 </dev/null >/dev/null 2>/tmp/familyRoomCam.log &
ffmpeg -i rtsp://192.168.1.6:554/unicast -r 30 -b:v 1k -vcodec copy  -t 900 $RECpath/shed_$name.mp4 </dev/null >/dev/null 2>/tmp/shedCam.log &
