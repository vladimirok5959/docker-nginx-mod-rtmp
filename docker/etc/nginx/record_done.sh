#!/bin/bash

FILE_NAME="$1"     # stream
FILE_PATH="$2"     # /var/www/html/recordings/stream-1653927205-30052022-161325.flv
FILE_BASENAME="$3" # stream-1653927205-30052022-161325

# Convert FLV to MP4
/usr/bin/ffmpeg -i ${FILE_PATH} -c copy /tmp/${FILE_BASENAME}.mp4 && \
/bin/mv /tmp/${FILE_BASENAME}.mp4 /var/www/html/recordings && \
/bin/rm ${FILE_PATH}

# Do something here...
