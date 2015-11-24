#!/bin/bash

set -e

MAKE="make -C /tuleap"

options=`getopt -o h -l less,autoload,rnc2rng -- "$@"`

eval set -- "$options"

while true
do
    case "$1" in
	--less)
	    less=1
	    shift 1;;
	--autoload)
	    autoload=1
	    shift 1;;
	--rnc2rng)
	    rnc2rng=1
	    shift 1;;
	--)
	    shift 1; break ;;
	*)
	    break ;;
    esac
done

if [ -n "$less" ]; then
    $MAKE less
fi

if [ -n "$autoload" ]; then
    $MAKE autoload
fi

if [ -n "$rnc2rng" ]; then
    $MAKE rnc2rng
fi

