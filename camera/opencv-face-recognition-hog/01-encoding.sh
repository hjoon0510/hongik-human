#!/usr/bin/env bash

# Note: The Raspberry Pi is not capable of running the CNN detection method.
# If you want to run the CNN detection method, you should use a capable compute,
# ideally one with a GPU if you’re working with a large dataset.
# Otherwise, use the hog  face detection method.
# --detection-method hog
# --detection-method cnn

echo -e "Encoding dataset ..."
python encode_faces.py \
    --dataset dataset \
    --encodings encodings.pickle \
    --detection-method hog
