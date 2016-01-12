#!/bin/bash

error() {
    echo "*** ERROR: $@" >2
    exit 1
}

check_variables() {
    if [ -z "$USER" ]; then
       error "missing -e USER=\$(id -u) variable"
    fi
    if [ -z "$GROUP" ]; then
       error "missing -e GROUP=\$(id -g) variable"
    fi
}

check_variables

gosu "$USER:$GROUP" "/run-as-owner.sh" "$@"
