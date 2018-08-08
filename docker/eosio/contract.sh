#!/bin/bash
set -e


function set_contract()
{
  _open_un_lock_wallet
  run_cmd "sh eos.sh cli 'set contract hexing $project_path/contracts/eosio.token.pausable -x 1000s -p hexing@active'"
}
