#!/usr/bin/env bash
set -e
mkdir -p ./http/config
pushd ../SmartContract/truffle/
truffle migrate --reset | tee >( sed -e '1,/^2_deploy_contracts.js$/d' -e '/^   > contract address:.*/!d' -e 1q | awk '{print $4}' | tee ../../Experiments/config/contract | tee ../../Experiments/http/config/contract)
popd
