
# How to build images

This section describes methods to create your own custom dataset for facial recognition.

### Using OpenCV and Webcam on RPi3 board
The first method will use OpenCV and a webcam to (1) detect faces in a video stream and (2) save the example face images/frames to disk.

```bash
python build_face_dataset.py \
    --cascade haarcascade_frontalface_default.xml \
    --output dataset/gildong
```


### Using MS Bing image search API


First of all, you must modify is the API_KEY . You can grab an API key by logging into Microsoft Cognitive Services and selecting the service you’d like to use (as shown above where you need to click the “Get API Key” button).
 * https://azure.microsoft.com/en-us/try/cognitive-services/?api=bing-image-search-api

```bash
$ mkdir dataset/owen_grady
$ python search_bing_api.py --query "owen grady" --output dataset/owen_grady
```

### Manual collection of face images
This method is to manually find and save example face images yourself. Or you will need to manually inspect:

 * Search engine results (ex., Google, Bing)
 * Social media profiles (Facebook, Twitter, Instagram, SnapChat, etc.)
 * Photo sharing services (Google Photos, Flickr, etc.)
