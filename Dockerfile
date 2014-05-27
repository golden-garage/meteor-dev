FROM ubuntu:14.04

MAINTAINER Rick Golden "golden@golden-garage.net"


RUN update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX


RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:chris-lea/node.js

RUN apt-get update
RUN apt-get -y dist-upgrade


RUN apt-get install -y curl git nodejs


RUN curl https://install.meteor.com/ | sh

RUN npm install -g meteorite


WORKDIR /opt/application


RUN mrt install
RUN meteor update


EXPOSE 3000


CMD meteor
