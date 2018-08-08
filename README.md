
# EOS 本地单节点开发智能合约环境

### dependency
    docker
### env
    mac

```
sh eos.sh

    Usage: sh eos.sh [options]

        Valid options are:

        run
        restart
        clean

        cpp
        cli

        send_cmd_to_eos_container


sh eos.sh run


# 开发新合约
sh eos.sh cpp 'contracts' '-n demo'


sh eos.sh cpp 'contracts/demo' '-g demo.abi demo.cpp'
sh eos.sh cpp 'contracts/demo' '-o demo.wast demo.cpp'

sh eos.sh cli 'set contract ...'

## eosjs 与合约交互



```
