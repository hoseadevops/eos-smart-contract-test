
# EOS 本地单节点测试网络智能合约开发 hello world

### dependency
    docker
### env
    mac

```
sh docker.sh

    Usage: sh docker.sh [options]

        Valid options are:

        run
        restart
        clean
        cpp

        send_cmd_to_eos_container


sh docker.sh run

# 测试RPC
# cleos get info
curl http://localhost:8866/v1/chain/get_info

# RPC 文档
# http://eos.readthedocs.io/zh_CN/latest/API/EOSIO-RPC/

# alias cleos
alias cleos='docker exec -it hexing-smart-contract-eosio /opt/eosio/bin/cleos -u http://0.0.0.0:8888 --wallet-url http://0.0.0.0:8888'

# 钱包

## 创建钱包
cleos wallet open -n hex_wallet【在重启的时候】
cleos wallet create -n hex_wallet 【创建】
cleos wallet lock -n hex_wallet 【锁定】
cleos wallet unlock -n hex_wallet 【解锁】
cleos wallet list 【钱包列表】

## 钱包密码
PW5JbhTWNehzYf5VSsD1tZnp2TDqW8SiCMVSMw4sN7Pej5bVBQUBV

## 创建秘钥对
cleos create key

Private key: 5JGX6NQxXDcTreFwbuUb1CC7Dj2BJf7pFByi4g7TnqeQT159znk
Public key: EOS6u4B7BSzWdZGYQsUYymqPCstcu3XJd6ReXoCTHiFurfyw1mct7

Private key: 5JguUDQX9FWiX51cTqCnH6FvtoWSPqCw8QjJPEgFUR9yZ2Lbxhu
Public key: EOS5iJnC63B8MNAzVQZhMkUqir3FgZCVS2UwppHcCt2oTLPCKDh3E

Private key: 5K6hKaMGy99fvpWc6xB2hZPy5XHVmLYyrPfYA8NpHkRCyWm7eg6
Public key: EOS8UKmEaLG1L88oBQSDAfDBWa1EDvP7UTh7pKqQJ1cSPmz9UtTBw


## 钱包导入私钥
cleos wallet import -n hex_wallet --private-key 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3

cleos wallet import -n hex_wallet --private-key 5JGX6NQxXDcTreFwbuUb1CC7Dj2BJf7pFByi4g7TnqeQT159znk

cleos wallet import -n hex_wallet --private-key 5JguUDQX9FWiX51cTqCnH6FvtoWSPqCw8QjJPEgFUR9yZ2Lbxhu

cleos wallet import -n hex_wallet --private-key 5K6hKaMGy99fvpWc6xB2hZPy5XHVmLYyrPfYA8NpHkRCyWm7eg6


## check
cleos wallet keys

cleos wallet private_keys -n hex_wallet --password PW5JbhTWNehzYf5VSsD1tZnp2TDqW8SiCMVSMw4sN7Pej5bVBQUBV

## 创建账户

cleos create account eosio hex EOS5iJnC63B8MNAzVQZhMkUqir3FgZCVS2UwppHcCt2oTLPCKDh3E  EOS6u4B7BSzWdZGYQsUYymqPCstcu3XJd6ReXoCTHiFurfyw1mct7

cleos create account eosio user EOS8UKmEaLG1L88oBQSDAfDBWa1EDvP7UTh7pKqQJ1cSPmz9UtTBw EOS8UKmEaLG1L88oBQSDAfDBWa1EDvP7UTh7pKqQJ1cSPmz9UtTBw

cleos create account eosio tester EOS8UKmEaLG1L88oBQSDAfDBWa1EDvP7UTh7pKqQJ1cSPmz9UtTBw EOS8UKmEaLG1L88oBQSDAfDBWa1EDvP7UTh7pKqQJ1cSPmz9UtTBw

cleos create account eosio eosio.token EOS8UKmEaLG1L88oBQSDAfDBWa1EDvP7UTh7pKqQJ1cSPmz9UtTBw EOS8UKmEaLG1L88oBQSDAfDBWa1EDvP7UTh7pKqQJ1cSPmz9UtTBw


# 查看该公钥的所有账户
cleos get accounts EOS8UKmEaLG1L88oBQSDAfDBWa1EDvP7UTh7pKqQJ1cSPmz9UtTBw

# 查看账户
cleos get account hex



# 翻墙加速【用现有镜像可以不做】
git clone https://github.com/EOSIO/eos --recursive
下载失败 可以继续实行：git submodule update --init --recursive
# alias eosiocpp 【用现有镜像可以不做】
alias eosiocpp='docker exec hexing-smart-contract-eosio eosiocpp'

# bios
cleos set contract eosio docker/persistent/contracts/eosio.bios -x 1000s -p eosio@active


# 部署智能合约
cleos set contract eosio.token docker/persistent/contracts/eosio.token -p eosio.token@active


## 创建智能合约

sh docker.sh cpp 'contracts' '-n hello'
// 编译
sh docker.sh cpp 'contracts/hello' '-o hello.wast hello.cpp'
sh docker.sh cpp 'contracts/hello' '-g hello.abi hello.cpp'

// 创建账户 部署合约		
cleos create account eosio hello.code EOS8UKmEaLG1L88oBQSDAfDBWa1EDvP7UTh7pKqQJ1cSPmz9UtTBw EOS8UKmEaLG1L88oBQSDAfDBWa1EDvP7UTh7pKqQJ1cSPmz9UtTBw		
// 部署合约
cleos set contract hello.code contracts/hello -p hello.code@active

// 交互合约
cleos push action hello.code hi '["user"]' -p user@active
cleos push action hello.code hi '["hex"]' -p user@active


## eosjs 与合约交互




```
