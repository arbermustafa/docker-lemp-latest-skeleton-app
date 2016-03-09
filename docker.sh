#!/bin/bash
# Bash script for common docker commands

DCK="docker"
DCKCMP="docker-compose"
ECHO_CMD="echo -e "
COMPOSER_SRC="$(pwd)/src"
COMPOSER_DST="/var/www/html"

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
        $DCK rm -v $($DCK ps -a -q)
        ;;

    "rm_images")
        $DCK rmi $($DCK images -q)
        ;;

    "rm_all")
        $0 rm_containers
        $0 rm_images
        ;;

esac
