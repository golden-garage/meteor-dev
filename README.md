meteor-dev
==========

A [Dockerfile](http://docs.docker.io/en/latest/reference/builder/) 
for building a [Meteor](http://www.meteor.com) container
that can be used during development.


Intro
-----

I've been playing with light-weight containers from [Docker.io](http://docker.io). 

For development, I really like the concept of using "lightweight, portable, self-sufficient containers" instead of
installing and maintaining a collection of servers or VMs (on my desktop or in the cloud).

This is a first attempt at creating a `docker` container that can be used for Meteor development.

It works well on Linux, but requires a bit of hacking elsewhere. 

I am currently using it on Ubuntu in a VirtualBox running on a MacBook.


Prerequisite
------------

- A modern 64-bit 3.8+ Linux Kernel that supports [LXC](https://linuxcontainers.org/) ([Ubuntu Saucy](http://releases.ubuntu.com/13.10/))
 

Usage 
-----

    docker build --tag="meteor-dev" git://github.com/golden-garage/meteor-dev

    docker run -p 3000:3000 -t -i -v /path/to/meteor/app:/opt/application meteor-dev


Details
-------

First, [install docker](https://www.docker.io/gettingstarted/#h_installation). 


Then, build your own Meteor container directly from this repo. It will be tagged locally as `meteor-dev`.

    docker build --tag="meteor-dev" git://github.com/golden-garage/meteor-dev


Finally, run the container attached to a local directory (e.g. `/path/to/meteor/app`).

    docker run -p 3000:3000 -t -i -v /path/to/meteor/app:/opt/application meteor-dev


You can view the running Meteor application in a web browser at `http://127.0.0.1:3000`.


The `docker run` command runs interactively (`-t -i`) so that you can see the output of Meteor as it is running.

Now, when you change the source code of your Meteor app (located in the local directory `/path/to/meteor/app/`), 
the instance of Meteor running in the `meteor-dev` container will update the app.

Hit `^C` in the window where the `meteor-dev` container is running, and the container will be stopped.


Each time you use `docker run` to start Meteor, you are creating a new container with a fresh install of Meteor. 

If you are using `meteorite` installed smart-packages, they will be automatically be installed when Meteor is started.


Cleanup
-------

You can clean up stopped containers by using `docker rm`.

This command will remove all your docker containers:

    for i in $(docker ps -a |awk '!/^C/ {print $1}'); do docker rm $i; done



Not sure (yet) about usage *on Mac OS X* (or *Windows*)
-------------------------------------------------------

Docker is really easy to use from Linux. For other operating systems, 
[workarounds are required.](https://github.com/boot2docker/boot2docker/blob/master/doc/WORKAROUNDS.md)



References
----------

- [Docker](http://docker.io)
- [Meteor](http://meteor.com)
- [LXC - Linux Containers](https://linuxcontainers.org/)
- [What does Docker add to just plain lxc?](http://stackoverflow.com/questions/17989306/what-does-docker-add-to-just-plain-lxc)
