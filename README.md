
# Build Secure Smart Contracts in C++

## The armors-eoscpp is a battle-tested framework of reusable smart contracts for EOS and WASM blockchains.

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



```
