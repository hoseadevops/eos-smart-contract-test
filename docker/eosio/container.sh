#!/bin/bash
set -e

function run_eosio()
{
    local args='--restart=always'

    args="$args --cap-add SYS_PTRACE"

    args="$args -p $NODEOS_PORT:8888 -p 9876:9876"

    args="$args -v $project_path:$project_path"

    args="$args -w $project_path"

    args="$args -v $project_docker_runtime_dir/eosio/work:/work"

    args="$args -v $project_docker_runtime_dir/eosio/data:/mnt/dev/data"

    args="$args -v $project_docker_persistent_dir/keosd:/mnt/dev/config"
    
    run_cmd "docker run -d $args --name $eosio_container $eosio_image \
    /bin/bash -c 'nodeos -d \
    /mnt/dev/data \
    --config-dir /mnt/dev/config \
    --http-server-address=0.0.0.0:8888 \
    --access-control-allow-origin=* --contracts-console --http-validate-host=false'"
}


function rm_eosio()
{
    rm_container $eosio_container
}
