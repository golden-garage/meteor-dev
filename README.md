meteor-dev
==========

A [Dockerfile](http://docs.docker.io/en/latest/reference/builder/) for building a [Meteor](http://www.meteor.com)
development container.


Revisions 
---------

Updated to **Meteor version 1.4.2.3.**

Added `python` and `build-essential` packages, in case `npm` needs them to rebuild node modules.


TL;DR
-----

Use the following bash alias to run meteor from the command-line using the current direcotry as the application source:

    alias mm='docker run -it --rm --name=meteor -v $PWD:/opt/application -p 3000:3000 golden/meteor-dev'


Here's an example of the alias in use:

    mm create new-meteor-app
    cd new-meteor-app
    mm npm install
    mm


**Note:** When interrupted using `ctrl-C`, meteor will restart, so use the `docker stop` command to shutdown the
server.



Run Meteor using a prebuilt docker container
--------------------------------------------

Download the `golden/meteor-dev` pre-built container from [Docker Hub](http://hub.docker.com).

    docker pull golden/meteor-dev


Run meteor using the application source code in the `/path/to/meteor/app` directory.

    docker run -it --rm -p 3000:3000 -v /path/to/meteor/app:/opt/application golden/meteor-dev


The application is now accessible on port 3000 of the localhost (`http://localhost:3000`).



Roll your own image
-------------------

Build your own image (`meteor-dev`) from the github repo.

    docker build --tag="meteor-dev" git://github.com/golden-garage/meteor-dev
    

Run meteor using the newly built image (`meteor-dev`).

    docker run -it --rm -p 3000:3000 -v /path/to/meteor/app:/opt/application -w /opt/application meteor-dev



Using the `meteor-dev` container
--------------------------------

When changes are made to the source code of the meteor application in the local directory (`/path/to/meteor/app/`), the
`meteor-dev` container automatically updates the running application. The application changes are seen immediately in
the browser, just as if meteor were installed locally.

You can check on the status of the meteor container by using the `docker ps` command.

The meteor server will attempt to restart when interrupted usng `ctrl-C`, so use `docker stop` to shutdown the server.



Cleanup
-------

The meteor image is stateless and can be automatically removed when stopped by using the `--rm` docker command switch.

Each time you use `docker run` to start Meteor without the `--rm` switch, a new container with a fresh install of
meteor is created. Each of these containers consumes disk space.

You can clean up stopped containers by using the `docker rm` command.



References
----------

- [Docker](http://docker.io)
- [Meteor](http://meteor.com)
