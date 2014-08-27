meteor-dev
==========

A [Dockerfile](http://docs.docker.io/en/latest/reference/builder/) 
for building a [Meteor](http://www.meteor.com) container
that can be used during development.

Updated Meteor to version 0.9.0.


Run Meteor using a trusted prebuilt docker container
----------------------------------------------------

[install `docker`](https://www.docker.io/gettingstarted/#h_installation)

download the [trusted](http://docs.docker.io/en/latest/use/workingwithrepository/#trusted-builds) 
`golden/meteor-dev` pre-built container from the [docker.io](http://docker.io) 
[shared repository](https://index.docker.io/).

    docker pull golden/meteor-dev


run Meteor using the source code in the `/path/to/meteor/app` directory

    docker run -it -p 3000:3000 -v /path/to/meteor/app:/opt/application -w /opt/application golden/meteor-dev


The Meteor application is now accessible on port 3000 of the localhost (`http://localhost:3000`).

The app directory (`/opt/application`) could be located anywhere in the image.


Roll your own image
-------------------

[install docker](https://www.docker.io/gettingstarted/#h_installation)

build your own image (`meteor-dev`) from this github repo

    docker build --tag="meteor-dev" git://github.com/golden-garage/meteor-dev
    

run Meteor using the image you built (`meteor-dev`)

    docker run -it -p 3000:3000 -v /path/to/meteor/app:/opt/application -w /opt/application meteor-dev



Detailed walkthrough
--------------------

First, [install `docker`](https://www.docker.io/gettingstarted/#h_installation). 


Then, build your own Meteor container directly from this github repo. It will be tagged locally as `meteor-dev`.

    docker build --tag="meteor-dev" git://github.com/golden-garage/meteor-dev


Finally, run the container attached to a local Meteor source code directory (e.g. `/path/to/meteor/app`).

    docker run -it -p 3000:3000 -v /path/to/meteor/app:/opt/application -w /opt/application meteor-dev


You can view the running Meteor application in a web browser at `http://127.0.0.1:3000`.


The `docker run` command runs interactively (`-t -i`) so that you can see the output of Meteor as it is running.

Your application's source code is mounted (`-v`) in the docker container at `/opt/application`. The Meteor server is started in this directory (`-w /opt/application`). It is not necessary to mount the application at `/opt/application`, you can define your own mountpoint in the docker image.

If you are using `meteorite` installed smart-packages, they will be automatically be installed when Meteor is started.


Using the `meteor-dev` container
--------------------------------

When you make changes to the source code of your Meteor app (located in the local directory `/path/to/meteor/app/`), 
the instance of Meteor running in the `meteor-dev` container will automatically update the running application and you will see the changes immediately in the browser, just as if Meteor was running on your desktop machine.

Press `^C` in the window where the `meteor-dev` container is running, and the container will be stopped.

If you instead press `^P ^Q` in the contianer window, the container will be released but not stopped. You can see the container is still running by using the `docker ps` command.

The running container can be used to create a new docker image.

    docker commit --run='{"WorkingDir":"/opt/application","Cmd":["meteor"]}' container-id




Cleanup
-------

Each time you use `docker run` to start Meteor, you are creating a new container with a fresh install of Meteor. 

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
- [Trusted Builds](http://docs.docker.io/en/latest/use/workingwithrepository/#trusted-builds)
