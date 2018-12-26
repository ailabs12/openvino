# openvino
OpenVINO Docker image with supporting of CPU and GPU
# Run Docker container:
## in CPU mode
```
docker run -it digtlab/openvino
```
## in GPU mode
```
docker run \
    --device /dev/dri:/dev/dri \
    -v $pwd/wip:/mnt \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    digtlab/openvino
```
