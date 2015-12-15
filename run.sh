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

create_run_user() {
    if ! getent group "$GROUP" &> /dev/null ; then
        groupadd -g "$GROUP" runner
    fi

    useradd -g "$GROUP" -u "$USER" -m runner
}

command="/run-as-owner.sh $@"

check_variables
create_run_user
su --login --command "$command" runner
