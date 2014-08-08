#!/bin/bash

set -e

options=`getopt -o h -l less,autoload,user-id: -- "$@"`

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
  --user-id)
      user_id=$2
      shift 2;;
	--)
	    shift 1; break ;;
	*)
	    break ;;
    esac
done

if [ ! -n "$user_id" ]; then
    echo "You must specify a user id! (--user-id)"
    exit 1
fi

if [ -n "$less" ]; then
    make less USER_ID=$user_id -C /tuleap
fi

if [ -n "$autoload" ]; then
    make autoload-with-userid USER_ID=$user_id -C /tuleap
fi
