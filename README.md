# signal
Dockerfile for running signal-desktop inside a container.

# build
Steps to manually build and run
```git clone https://www.github.com/robinpriceii/signal
cd signal
docker build -t signal .
```

Make sure to have `~/.config/Signal` created.

# run
```
docker run --rm -it \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e DISPLAY \
        -e XAUTHORITY \
        -v $XAUTHORITY:$XAUTHORITY \
        -v $HOME/.config/Signal:/home/signal/.config/Signal \ 
        signal 
```

# run without build
https://hub.docker.com/r/rprice/signal/
```
docker run --rm -it \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e DISPLAY \
        -e XAUTHORITY \
        -v $XAUTHORITY:$XAUTHORITY \
        -v $HOME/.config/Signal:/home/signal/.config/Signal \ 
        --name signal \ 
        rprice/signal
```
