FROM nvidia/opengl:1.0-glvnd-devel-ubuntu18.04
MAINTAINER motbus3

RUN apt-get update && apt-get install -y apt-utils build-essential curl g++ freeglut3-dev module-init-tools
RUN apt-get install -y binutils mesa-utils
# get file from https://www.nvidia.com/object/unix.html
# ADD nvidia-driver.run /tmp/
RUN curl -q http://us.download.nvidia.com/XFree86/Linux-x86_64/340.107/NVIDIA-Linux-x86_64-340.107.run -v -o /tmp/nvidia-driver.run
RUN sh /tmp/nvidia-driver.run -a -N --ui=none --no-kernel-module --no-network
RUN rm /tmp/nvidia-driver.run

ENTRYPOINT bash

# execute this with nvidia-docker (v2) as:
# docker build -t nvidia-opengl-dev -f nvidia-opengl-dev.dockerfile .
# nvidia-docker run -v $(pwd):/workspace -e DISPLAY=unix$DISPLAY --privileged --volume $XAUTH:/root/.Xauthority -v /tmp/.X11-unix:/tmp/.X11-unix:rw --name ubuntu -it -w /workspace --rm nvidia-opengl-dev bash

