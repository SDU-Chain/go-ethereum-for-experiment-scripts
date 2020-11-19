#!/usr/bin/env bash
set -e

read -p "Which account to be used (0 represents the server)? " carid
if ! [[ "$carid" == ?(-)+([0-9]) ]] ; then
	echo "error: Not a number" >&2; exit 1
fi

account_dir="./gethaccounts/nodes/$carid"

if [[ "s$carid" == "s0" ]] ; then
	account_dir="./gethaccounts/sealer"
fi

account=`cat "$account_dir/keystore/"* | head -n 1 | jq --raw-output .address`
echo "$account" > ./config/account
echo "Account: $account"
cat ./config/account

rm -rf ./gethdata/* || true
cp -r "$account_dir/keystore" "./gethdata"

./init_geth.sh
