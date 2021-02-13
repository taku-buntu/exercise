#!/bin/bash
set -eu

DATA_DIR=/home/iida/data

docker run --rm -it --privileged    --mount "type=bind,source=$(readlink -f $(dirname $0)),destination=/workspace" \
                                    --mount "type=bind,source=${DATA_DIR},destination=/data" \
                                    --gpus all \
                                    --net host \
                                    --env DISPLAY=$DISPLAY \
                                    --volume $HOME/.Xauthority:/root/.Xauthority \
                                    --device /dev/video0:/dev/video0:mwr \
                                    exercise /bin/bash
