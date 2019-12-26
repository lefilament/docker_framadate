# This repo contains docker files for framadate by Le Filament

This docker is created from [Framasoft/Framapad](https://framagit.org/framasoft/framadate/framadate/tree/develop/docker/stretch) and gets all the git repo inside a docker instead of mounting a local volume
The original files being protected by CeCILL-B license, the same license is kept here. For more information on source code, please visit previous link.


Docker-compose file to be used with this can be found on [corresponding Le Filament Ansible role](https://github.com/lefilament/ansible/tree/master/roles/docker_framadate/templates/docker-compose.yaml.j2)


This docker image is also pushed on [Docker Hub](https://hub.docker.com/r/lefilament/framadate)

This image is basically downloading Framadate from [Framasoft gitlab repository](https://framagit.org/framasoft/framadate/framadate) and serving it on port 80 (when original image relies on cloning locally the Framadate repository), it also replaces mysql-client with mariadb-client.

