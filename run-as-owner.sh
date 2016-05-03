#!/bin/bash

set -e

MAKE="make -C /tuleap"

options=`getopt -o h -l less,sass,autoload,rnc2rng,grunt: -- "$@"`

eval set -- "$options"

while true
do
    case "$1" in
	--less)
	    less=1
	    shift 1;;
	--sass)
	    sass=1
	    shift 1;;
	--autoload)
	    autoload=1
	    shift 1;;
	--rnc2rng)
	    rnc2rng=1
	    shift 1;;
	--grunt)
	    grunt=1
	    grunt_path=$2
	    shift 2;;
	--)
	    shift 1; break ;;
	*)
	    break ;;
    esac
done

if [ -n "$less" ]; then
    $MAKE less
fi

if [ -n "$less" ]; then
    $MAKE sass
fi

if [ -n "$autoload" ]; then
    $MAKE autoload
fi

if [ -n "$rnc2rng" ]; then
    $MAKE rnc2rng JAVA_CMD=/usr/bin/java
fi

if [ -n "$grunt" ]; then
    $MAKE grunt GRUNT_PATH=$grunt_path
fi
