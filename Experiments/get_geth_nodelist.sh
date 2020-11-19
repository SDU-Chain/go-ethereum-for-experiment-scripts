#!/usr/bin/env bash
set -e

curl http://127.0.0.1:8545 -s -X POST -H 'Content-Type: application/json' --data '{"jsonrpc":"2.0","method":"admin_peers","params":[],"id":'"$RANDOM"'}'
