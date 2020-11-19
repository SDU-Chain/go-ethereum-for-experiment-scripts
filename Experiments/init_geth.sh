#!/usr/bin/env bash
set -e
./kill_geth.sh
pushd ./gethdata
rm geth.ipc || true
rm -rf geth/ || true
popd
cp ./genesis.json ./http/genesis.json
./bin/geth-timing --experiment.output=./output/deleteme.txt --nousb --datadir ./gethdata init ./genesis.json


