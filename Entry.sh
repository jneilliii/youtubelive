#!/bin/bash

echo OctoPrint Webcam Stream: $1
echo echo Live-stream secret: $2

ffmpeg -re -f mjpeg -framerate 5 -i $1 -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero -acodec aac -ab 128k -strict experimental -vcodec h264 -pix_fmt yuv420p -g 10 -vb 700k -framerate 5 -f flv rtmp://a.rtmp.youtube.com/live2/$2
