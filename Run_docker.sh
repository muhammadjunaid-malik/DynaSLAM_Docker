xhost +
# --cap-add=SYS_PTRACE --security-opt seccomp=unconfined \
docker run -it --rm \
    -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -e __NV_PRIME_RENDER_OFFLOAD=1 -e __GLX_VENDOR_LIBRARY_NAME=nvidia \
    --runtime nvidia -e NVIDIA_DRIVER_CAPABILITIES=all -e NVIDIA_VISIBLE_DEVICES=all \
    --cap-add=SYS_PTRACE --security-opt seccomp=unconfined \
    -v $(pwd)/Dataset:/home/Dataset -v $(pwd)/output:/home/DynaSLAM/output --name=dyna \
    --gpus all \
    dyna bash