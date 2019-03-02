# NVIDIA-DOCKER OpenGL Container

I just wanted to have a OpenGL development environment on my machine. But if you have a NVIDIA driver, you may install nvidia driver (same of your host) inside the container and share X11 Display

* On your host

```

docker build -t nvidia-opengl-dev -f nvidia-opengl-dev.dockerfile .
xhost local:root
```

* Then start the container with nvidia-docker (tested with nvidia-docker v2.0.3)
For nvidia-docker instructions:
- https://nvidia.github.io/nvidia-docker/
- https://github.com/nvidia/nvidia-docker/wiki/Installation-(version-2.0)


```
nvidia-docker run -v $(pwd):/workspace -e DISPLAY=unix$DISPLAY --privileged --volume $XAUTH:/root/.Xauthority -v /tmp/.X11-unix:/tmp/.X11-unix:rw --name ubuntu -it -w /workspace --rm nvidia-opengl-dev bash
```
