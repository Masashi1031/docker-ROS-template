docker run --gpus all --privileged --name container_name --net=host \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -itd nvidia/cudagl-10.1-devel-ubuntu18.04:ros-melodic /bin/bash

