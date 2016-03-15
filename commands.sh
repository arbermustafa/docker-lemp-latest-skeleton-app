#!/bin/bash
# Bash script for common docker commands

if [ -f vars.rc ];then
    . vars.rc
else
    echo "vars.rc doesn't exist!"
    exit 1;
fi

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
        
    "clone_repo")
        $GIT clone $2 $COMPOSER_SRC && rm -rf $COMPOSER_SRC/.git*
        ;;

    "rm_containers")
        $DCK rm -v $($DCK ps -a -q -f status=exited)
        ;;

    "rm_images")
        $DCK rmi $($DCK images -q)
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
