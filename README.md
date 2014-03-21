meteor-dev
==========

A [Dockerfile](http://docs.docker.io/en/latest/reference/builder/) 
for building a [Meteor](http://www.meteor.com) container
that can be used during development.


Intro
-----

I've been playing with light-weight containers from [Docker.io](http://docker.io). 

For development, I really like the concept of using "lightweight, portable, self-sufficient containers" instead of
installing and maintaining a collection of virtual servers (on my desktop or in the cloud).

This is a first attempt at creating a `docker` container that can be used for Meteor development.

It works well on Linux, but requires a bit of hacking elsewhere. 

I am currently using Ubuntu in VirtualBox on a MacBook.


Usage *on Linux*
----------------

First, [install docker](https://www.docker.io/gettingstarted/#h_installation). 


Then, build your own Meteor container directly from this repo. It will be tagged locally as `meteor-dev`.

    docker build --tag="meteor-dev" git://github.com/golden-garage/meteor-dev


Finally, run the container on top of a local directory (e.g. `/path/to/meteor/app`).

    docker run -p 3000:3000 -t -i -v /path/to/meteor/app:/opt/application meteor-dev


The `docker run` command runs interactively (`-t -i`) so that you can see the output of Meteor as it is running.

Now, when you change the source code of your Meteor app (located in `/path/to/meteor/app/`), the instance of Meteor
running in the `meteor-dev` container will react and restart (or display an error message).

Hit `^C` in the window where the `meteor-dev` container is running, and the container will be stopped.

Each time you use `docker run` to start Meteor, you are starting from a fresh install of Meteor. If you are using
smart-packages, they will automatically be installed when Meteor is started.


Not sure (yet) about usage *on Mac OS X* (or *Windows*)
-------------------------------------------------------

[Workarounds are required.](https://github.com/boot2docker/boot2docker/blob/master/doc/WORKAROUNDS.md)
