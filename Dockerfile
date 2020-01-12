FROM codercom/code-server:latest

USER root

COPY . /tmp/

RUN sh /tmp/install-docker.sh\
    && groupadd -g 999 docker\ 
    && usermod -aG docker coder

RUN apt install -y gnupg2

RUN sh /tmp/install-pg11.sh

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    gnupg2\
    curl\
    python3\
    python3-pip\
    postgresql-client-common\
    postgresql-client-11\
    postgis

USER coder
