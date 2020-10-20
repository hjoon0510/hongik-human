#!/usr/bin/env bash

echo -e "Running application with python3..."
## with camera (v4l2)
if [[ $1 == camera ]]; then
    time python3 social_distance_detector.py
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
