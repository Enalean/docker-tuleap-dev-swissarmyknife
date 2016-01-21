#!/bin/bash

error() {
    echo "*** ERROR: $@" >2
    exit 1
}

is_dir() {
    local dir=$1

    [[ -d $dir ]]
}

get_user_group_id_tuleap() {
    stat -c '%u:%g' /tuleap
}

is_dir /tuleap \
    || error 'Missing /tuleap (did you mount the volume?)'

gosu "$(get_user_group_id_tuleap)" "/run-as-owner.sh" "$@"
