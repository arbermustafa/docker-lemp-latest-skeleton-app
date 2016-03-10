#!/bin/bash
# Bash script for common docker commands

DCK="docker"
DCKCMP="docker-compose"
ECHO_CMD="echo -e "
COMPOSER_SRC="$(pwd)/src"
COMPOSER_DST="/path/to/document/root/on/container"

case "$1" in

    "run")
        $DCKCMP up -d
        ;;

    "stop")
        $DCKCMP stop
        ;;

    "ps")
        $DCK ps -a
        ;;

    "bash")
        $DCK exec -it $2 bash
        ;;

    "composer")
        $DCK run --rm -u $UID -v $COMPOSER_SRC:$COMPOSER_DST -w $COMPOSER_DST composer/composer $2
        ;;

    "rm_containers")
        $DCK rm -v $($DCK ps -a -q -f status=exited)
        ;;

    "rm_images")
        $DCK rmi $($DCK images -q -f dangling=true)
        ;;
        
    "rm_volumes")
        $DCK volume rm $($DCK volume ls -q -f dangling=true)
        ;;

    "rm_all")
        $0 rm_containers
        $0 rm_images
        $0 rm_volumes
        ;;

esac
