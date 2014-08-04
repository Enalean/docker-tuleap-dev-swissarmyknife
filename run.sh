#!/bin/bash

set -e

options=`getopt -o h -l less -- "$@"`

eval set -- "$options"

less=1

while true
do
    case "$1" in
	--less)
	    less=1
	    shift 1;;
	--)
	    shift 1; break ;;
	*)
	    break ;;
    esac
done

if [ "$less" == 1 ]; then
    make less -C /tuleap
fi