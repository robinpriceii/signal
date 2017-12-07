# docker run --rm -it \
#        -v /tmp/.X11-unix:/tmp/.X11-unix \
#        -e DISPLAY \
#        -e XAUTHORITY \
#        -v $XAUTHORITY:$XAUTHORITY \
#        -v $HOME/.config/Signal:/home/signal/.config/Signal \ 
#        --name signal \
#         rprice/signal

FROM debian:latest

RUN apt-get update -y && apt-get install -y \
    gnupg \
    apt-transport-https \
    libasound2 \
    curl 

# Add signal debian repo
# Instructions located: https://signal.org/download/#linuxModal
RUN curl -s https://updates.signal.org/desktop/apt/keys.asc | apt-key add -
RUN echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" |  tee -a /etc/apt/sources.list.d/signal-xenial.list
RUN apt-get update -y && apt-get install -y \
    signal-desktop

# Make signal user
ENV HOME /home/signal
RUN useradd --create-home --home-dir $HOME signal && \
    mkdir -p $HOME/.config/Signal && \
    chown -R signal:signal $HOME

WORKDIR $HOME
USER signal

# Start Signal
ENTRYPOINT ["signal-desktop"]
