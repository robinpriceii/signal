# signal
Dockerfile for running signal-desktop inside a container.

Make sure to have `~/.config/Signal` created.

```
docker run --rm -it \
        -v /tmp/.X11-unix/:/tmp/.X11-unix \
        -e DISPLAY=unix$DISPLAY \
        -v $HOME/.config/Signal:/home/signal/.config/Signal \ 
        -v $XAUTHORITY:$XAUTHORITY --net=host \
        --name signal signal-desktop
```
