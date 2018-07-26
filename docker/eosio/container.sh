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

    args="$args -v $project_docker_persistent_dir/contracts:/mnt/dev/contracts"

    local cmd1="bash docker.sh send_cmd_to_eos_container 'cp -R /contracts /mnt/dev'"
    run_cmd "docker run -d $args --name $eosio_container $eosio_image \
    /bin/bash -c 'nodeos -d \
    /mnt/dev/data \
    --config-dir /mnt/dev/config \
    --http-server-address=0.0.0.0:8888 \
    --access-control-allow-origin=* --contracts-console --http-validate-host=false'; $cmd1"
}


function rm_eosio()
{
    rm_container $eosio_container
}

function send_cmd_to_eos_container()
{
    local cmd=$2
    run_cmd "docker exec -it $eosio_container bash -c '$cmd'"
}

function cpp()
{
    local dir=$2
    local cmd=$3
    run_cmd "docker exec -it $eosio_container bash -c 'cd $dir; eosiocpp $cmd'"
}
