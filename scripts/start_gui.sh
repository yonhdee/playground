#!/bin/bash

# current folder as WORD_DIR
CURRENT_DIR=$(pwd)

set -eo pipefail

xhost +
docker run -itd --name ros2_playground \
    --entrypoint ./scripts/entrypoint.sh \
    --gpus all \
    --rm \
    --network=host \
    --privileged \
    -e DISPLAY=$DISPLAY \
    -e XDG_RUNTIME_DIR=/tmp/runtime-$UID \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/.Xauthority:/root/.Xauthority \
    -v /dev/input:/dev/input:rw \
    -v /dev/dri:/dev/dri \
    -v $CURRENT_DIR:/root/ros2_ws:rw \
    -w /root/ros2_ws \
    ros2_playground:latest
