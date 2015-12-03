#!/bin/bash

set -e

error() {
    echo "*** ERROR: $@" >2
    exit 1
}

check_variables() {
    if [ -z "$USER" ]; then
	error "missing -e USER=$(id -u) variable"
    fi
    if [ -z "$GROUP" ]; then
	error "missing -e GROUP=$(id -g) variable"
    fi
}

create_run_user() {
    groupadd -g $GROUP runner
    useradd -g $GROUP -u $USER -m runner
}

check_variables
create_run_user
su --login --command "/run-as-owner.sh $@" runner
