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

    args="$args -v $project_docker_eosio_dir/conf:/mnt/dev/config"

    run_cmd "docker run -d $args --name $eosio_container $eosio_image \
    /bin/bash -c 'nodeos -e -p eosio \
    --plugin eosio::wallet_api_plugin \
    --plugin eosio::wallet_plugin \
    --plugin eosio::producer_plugin \
    --plugin eosio::history_plugin \
    --plugin eosio::chain_api_plugin \
    --plugin eosio::history_api_plugin \
    --plugin eosio::http_plugin \
    -d /mnt/dev/data \
    --config-dir /mnt/dev/config \
    --http-server-address=0.0.0.0:8888 \
    --access-control-allow-origin=* --contracts-console --http-validate-host=false'"
}


function rm_eosio()
{
    rm_container $eosio_container
}
