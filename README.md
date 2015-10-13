#Nginx + PHP-fpm
This repo forms the basis of an easy way to setup horizontally scaling PHP-fpm servers, behind an Nginx load-balancer

##Dependencies
###docker-compose
I use `docker-compose` to link the containers.

I had trouble using this on OSX, but found some useful information here: [https://github.com/docker/compose/issues/271](https://github.com/docker/compose/issues/271). Note that I installed Docker using Kitematic.

These issues seemed to have been fixed with some recent updates of Docker to bundle all software into the Docker Toolbox. Everything worked perfectly with the Toolbox on a fresh install.

###Docker Volume
You also need to have a docker volume contianer, (I've called mine `src`) to mount the files in `/app` and replicate across each of the containers. You can read more about volumes [here](https://docs.docker.com/userguide/dockervolumes/).

To create the one required here, run:

`docker create -v /path/to/docker/app:/src --name src nginx /bin/true`

where `/path/to/docker/app` is the absolute path to whatever files you want to mount on your host machine, i.e. a php app. You can link to `/docker/app` in this repositiory to see how it works. `/src` after the colon specifies the absolute path of where these files are mounted to within each container.

##Usage
Simply run `docker-compose up -d` from the root of the directory. It will build images and then run services of everything specified in the `docker-compose.yml` file.



##Notes
* To maintain predictability for the `docker scale` command, docker prefixes `docker_` to the start of container names specified in the `.yml` file and appends `_1` to the end of each instance. For example, the name `php1` will appear as a container `docker_php1_1`. This will appear as an entry in the hosts file of `docker_server_1` for a maintanable reference (otherwise the reference would be a random hash).
* Defining the `docker-compose.yml` with one `php` definition and intending to call `docker-compose scale php=3` (which would create 3 instances, called `docker_php_1`, `docker_php_2` and `docker_php_3`) after startup will cause nginx to fail (and so the instance won't start) becuase it would't have a reference to `docker_php_2` and `docker_php_3` as there won't be entries in the hosts file yet. That's why I defined them all indivitually. See first TODO below.
* For it to be possible to have Nginx and PHP-fpm on different servers, you need to replicate, identically, the file structure of your application, across all instances. Nginx simply sends the filename to the PHP-fpm server, and not the file itself.

##TODO
1. Figure out how to incorperate `docker-compose scale php=3` and remove the duplication of php service declarations in the `docker-compose.yml` file. To do this, we need to be able to configure the servers in nginx's `upstream` directive in `nginx.conf`.

