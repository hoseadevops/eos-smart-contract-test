#!/bin/bash

set -e

project_path=$(cd $(dirname $0); pwd -P)                            # 项目目录
project_docker_path="$project_path/docker"                          # 项目docker目录
source $project_docker_path/bash.sh                                 # 基础函数
developer_name=$('whoami');                                         # 开发者

#----------------------
# 如果有配置中心 在这里创建 .env
#----------------------

NODEOS_PORT=$(read_kv_config .env NODEOS_PORT)
KEOSD_PORT=$(read_kv_config .env KEOSD_PORT)

app_basic_name=smart-contract
app="$developer_name-$app_basic_name"

eosio_image=eosio/eos-dev

# container
eosio_container=$app-eosio

# container dir

project_docker_eosio_dir="$project_docker_path/eosio"

project_docker_runtime_dir="$project_docker_path/runtime"           # app runtime
project_docker_persistent_dir="$project_docker_path/persistent"     # app persistent

#---------- eosio container ------------#
source $project_docker_path/eosio/container.sh


function run()
{
    run_eosio
}

function restart()
{
    clean
    run_eosio
}

function clean()
{
    rm_eosio
    clean_runtime
}

function create_wallet()
{
  run_cmd "cd"
}

function clean_runtime()
{
    run_cmd "rm -rf $project_docker_runtime_dir/eosio/config"
    run_cmd "rm -rf $project_docker_runtime_dir/eosio/data"
    run_cmd "rm -rf $project_docker_runtime_dir/eosio/work"
}
#
# function clean_persistent()
# {
#
# }

function help()
{
cat <<EOF
    Usage: sh docker.sh [options]

        Valid options are:

        run
        restart
        clean

        create_wallet

EOF
}

action=${1:-help}
ALL_COMMANDS="run restart clean create_wallet"
list_contains ALL_COMMANDS "$action" || action=help
$action "$@"
