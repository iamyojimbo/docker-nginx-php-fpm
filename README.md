#Nginx + PHP-fpm
This repo forms the basis of an easy way to setup horizontally scaling PHP-fpm servers, behind an Nginx load-balancer

##Dependencies
I use *docker-compose* to link the containers.

I had trouble installing this on OSX, but found some useful information here: [https://github.com/docker/compose/issues/271](https://github.com/docker/compose/issues/271). Note that I installed Docker using Kitematic.

##Usage
Simply run `docker-compose up -d` from the root of the directory. It will build images of, and then run services of everything specified in the `docker-compose.yml` file.

##Notes
* To maintain predicatibiliy for the `docker scale` command, docker prefixes `docker_` to the start of container names specified in the `.yml` file and appends `_1` to the end of each instance. For example, the name `php1` will appear as a container `docker_php1_1`. This will appear as an entry in the hosts file of `docker_server_1` for a maintanable reference (otherwise the reference would be a random hash).
* Defining the `docker-compose.yml` with one `php` definition and intending to call `docker-compose scale php=3` (which would create 3 instances, called `docker_php_1`, `docker_php_2` and `docker_php_3`) after startup will cause nginx to fail (and so the instance won't start) becuase it would't have a reference to `docker_php_2` and `docker_php_3` as there won't be entries in the hosts file yet. That's why I defined them all indivitually. See first TODO below.

##TODO
1. Figure out how to incorperate `docker-compose scale php=3` and remove the duplication of php service declarations in the `docker-compose.yml` file. To do this, we need to be able to configure the servers in nginx's `upstream` directive in `nginx.conf`.

