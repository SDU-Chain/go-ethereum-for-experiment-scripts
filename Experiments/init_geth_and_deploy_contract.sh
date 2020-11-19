#!/usr/bin/env bash
set -e

# echo 0 | ./set_geth_account.sh

./init_geth.sh
echo deleteme | ./run_geth.sh

echo "sleep 5s to wait for geth to be initialized..."
sleep 5

./deploy_contract.sh
echo "sleep 5s..."
sleep 5

./kill_geth.sh

echo -n "Clear the output folder?[y/N] "
read ANS
if [ "$ANS" = Y ] || [ "$ANS" = y ]; then
	./clear_output.sh
fi
