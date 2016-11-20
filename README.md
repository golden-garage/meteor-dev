meteor-dev
==========

A [Dockerfile](http://docs.docker.io/en/latest/reference/builder/) 
for building a [Meteor](http://www.meteor.com) container
that can be used during development.

Updated Meteor to version 1.4.2.3.

I use the following bash alias to run meteor form the command-line during development:

    alias mm='docker run -it --rm -v $PWD:/opt/application -p 3000:3000 golden/meteor-dev'
   
    mm create new-meteor-app
    cd new-meteor-app
    mm npm install
    mm
    
The meteor server will attempt to restart when interrupted usng `ctrl-C`, so use `docker stop` to shutdown the server.


Run Meteor using a trusted prebuilt docker container
----------------------------------------------------

[install `docker`](https://www.docker.io/gettingstarted/#h_installation)

download the `golden/meteor-dev` pre-built container from [Docker Hub](http://hub.docker.com). 

    docker pull golden/meteor-dev


run Meteor using the source code in the `/path/to/meteor/app` directory

    docker run -it --rm -p 3000:3000 -v /path/to/meteor/app:/opt/application golden/meteor-dev


The Meteor application is now accessible on port 3000 of the localhost (`http://localhost:3000`).


**Note:** The app directory (`/opt/application`) could be located anywhere in the image. Use docker's working directory
option (`-w`) to change the location of the app directory (e.g., `-w /another/location`).


Roll your own image
-------------------

[install docker](https://www.docker.io/gettingstarted/#h_installation)

build your own image (`meteor-dev`) from this github repo

    docker build --tag="meteor-dev" git://github.com/golden-garage/meteor-dev
    

run Meteor using the image you built (`meteor-dev`)

    docker run -it --rm -p 3000:3000 -v /path/to/meteor/app:/opt/application -w /opt/application meteor-dev


Using the `meteor-dev` container
--------------------------------

When you make changes to the source code of your Meteor app (located in the local directory `/path/to/meteor/app/`),
the instance of Meteor running in the `meteor-dev` container will automatically update the running application and you
will see the changes immediately in the browser, just as if Meteor was installed on your desktop machine.

You can also check on the status of the meteor container by using the `docker ps` command.

The meteor server will attempt to restart when interrupted usng `ctrl-C`. 

Use `docker stop` to shutdown the server.


Cleanup
-------

The meteor image is stateless and can be automatically removed when stopped by using the `--rm` docker command switch.

Each time you use `docker run` to start Meteor without the `--rm` switch, a new container with a fresh install of
Meteor is created. Each of these containers consumes disk space.

You can clean up stopped containers by using `docker rm`.


References
----------

- [Docker](http://docker.io)
- [Meteor](http://meteor.com)
