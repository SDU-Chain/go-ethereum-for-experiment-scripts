#!/usr/bin/env bash
set -e

./run_geth.sh

# update enode
./update_geth_enode_config.sh

