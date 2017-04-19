FROM node:latest
MAINTAINER syscools@gmail.com

RUN apt-get update && apt-get install -y --no-install-recommends\
    vim\
    hexedit\
    tmux\
    xmlstarlet\
    jq\
    && npm install -g @angular/cli@latest\
    && mkdir /root/src && cd /root/src\
    && git clone https://github.com/syscools/commandline.git\
    && cd commandline\
    && ./setup.sh

WORKDIR /root
