FROM node:latest
MAINTAINER syscools@gmail.com

# Seems that I am compelled to have 2 RUN commands
RUN apt-get update && apt-get install -y --no-install-recommends apt-transport-https\
    && wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -\
    && echo "deb http://packages.cloudfoundry.org/debian stable main" |tee /etc/apt/sources.list.d/cloudfoundry-cli.list

RUN apt-get update && apt-get install -y --no-install-recommends\
    vim\
    hexedit\
    tmux\
    xmlstarlet\
    jq\
    cf-cli\
    && npm install -g @angular/cli@latest\
    && mkdir /root/src && cd /root/src\
    && git clone https://github.com/syscools/commandline.git\
    && cd commandline\
    && ./setup.sh

WORKDIR /root
