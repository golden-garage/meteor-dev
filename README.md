meteor-dev
==========

A [Dockerfile](http://docs.docker.io/en/latest/reference/builder/) for building a [Meteor](http://www.meteor.com) development container.


Revisions 
---------

### 2017-01-21 parameterize build

Added the following build arguments:
* `APP_PACKAGES` - allow additional software packages during build (e.g., imagemagick)
* `APP_LOCALE=en_US` - allow different locale for log messages
* `APP_CHARSET=UTF-8` - allow different charset for log messages
* `APP_USER=app` - allow a different username for the app user
* `APP_USER_DIR=/home/app` - allow a different home directory for the app user

Added the following environment variables:
* `APP_PORT=3000` - allow a different username for the meteor user
* `APP_ROOT=/app` - allow a different app root (changes meteor volume)

Changed the default working directory to `/app`.

### 2016-11-15 add software packages so that `meteor npm install` can build npm modules

Updated to **Meteor version 1.4.2.3.**

Added `python` and `build-essential` packages, in case `npm` needs them to rebuild node modules.

Now, `npm install --save bcrypt` works.


TL;DR
-----

Use the following bash alias to run meteor from the command-line using the current direcotry as the application source:

    alias app='docker run -it --rm --name=app -v $PWD:/app -p 3000:3000 golden/meteor-dev'


Here's an example of the alias in use:

    app create new-meteor-app
    cd new-meteor-app
    app npm install
    app


**Note:** When interrupted using `ctrl-C`, meteor will restart, so use the `docker stop app` command to shutdown the server.



Run Meteor using a prebuilt docker container
--------------------------------------------

Download the `golden/meteor-dev` pre-built container from [Docker Hub](http://hub.docker.com).

    docker pull golden/meteor-dev


Run meteor using the application source code in the `/path/to/meteor/app` directory.

    docker run -it --rm --name app -p 3000:3000 -v /path/to/meteor/app:/app golden/meteor-dev


The app is now accessible on port 3000 of the localhost (`http://localhost:3000`).

The app can be stopped using the `docker stop app` command.



Using the `meteor-dev` container
--------------------------------

When changes are made to the source code of the meteor application in the local directory (`/path/to/meteor/app/`), the `meteor-dev` container automatically updates the running application. The application changes are seen immediately in the browser, just as if meteor were installed locally.

You can check on the status of the meteor container by using the `docker ps` command.

The meteor server will attempt to restart when interrupted usng `ctrl-C`, so use `docker stop` to shutdown the server.



Cleanup
-------

The meteor image is stateless and can be automatically removed when stopped by using the `--rm` docker command switch.

Each time you use `docker run` to start Meteor without the `--rm` switch, a new container with a fresh install of meteor is created. Each of these containers consumes disk space.

You can clean up stopped containers by using the `docker container prune` command.

You can clean up unused volumes by using the `docker volume prune` command.



References
----------

- [Docker](http://docker.io)
- [Meteor](http://meteor.com)
