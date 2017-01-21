FROM ubuntu:latest

MAINTAINER Rick Golden "golden@golden-garage.net"

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl python build-essential
RUN DEBIAN_FRONTEND=noninteractive apt-get autoremove
RUN DEBIAN_FRONTEND=noninteractive apt-get clean

RUN localedef en_US.UTF-8 -i en_US -fUTF-8

RUN useradd -mUd /home/meteor meteor
RUN chown -Rh meteor /usr/local

USER meteor

RUN curl https://install.meteor.com/ | sh


WORKDIR /opt/application


EXPOSE 3000


ENTRYPOINT [ "/usr/local/bin/meteor" ]
