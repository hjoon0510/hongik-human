#!/usr/bin/env bash

echo -e "Running application with python3..."
echo -e "NOTE: If you want to quit a GUI app, press a 'q' key."
echo -e " "

## with camera (v4l2)
# if you wanna run  the GUI app, use "--display 1".
# if you wanna skip the GUI app, use "--display 0".
if [[ $1 == camera ]]; then
    time python3 social_distance_detector.py \
    --display 0

## with video files (mp4)
elif [[ $1 == video ]]; then
    time python3 social_distance_detector.py \
    --input pedestrians.mp4  \
    --output output.avi \
    --display 0
else
    echo -e "Usage:$0 {camera|video}"
    echo -e " * camera: /dev/video0"
    echo -e " * video : pedestrians.mp4"
fi
