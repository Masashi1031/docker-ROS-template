docker run --gpus all --privileged --name container_name --net=host \ # You can change container name using set-container-name 
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    # -v /dev:/dev \ # if you want to use USB devices etc... in container, you have to delete comment
    -itd nvidia/cudagl-10.1-devel-ubuntu18.04:ros-melodic /bin/bash

