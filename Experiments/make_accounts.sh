#!/usr/bin/env bash
set -e

read -p "How many node accounts do you want to generate? " count
if ! [[ "$count" == ?(-)+([0-9]) ]] ; then
	echo "error: Not a number" >&2; exit 1
fi

rm -rf ./gethaccounts/nodes/* || true

START=1
END="$count"

echo "Generating $count node accounts..."

i="$START"
while [[ "$i" -le "$END" ]]
do
	echo -n "($i/$END)"
	mkdir -p ./gethaccounts/nodes/"$i"
	./bin/geth-timing --experiment.output=./output/deleteme.txt --datadir ./gethaccounts/nodes/"$i" --password ./password/password.txt account new > /dev/null 2>&1
	printf '\r'
	((i = i + 1))
done

echo "Creating tar archive..."
mkdir -p ./http/gethaccounts
cd ./gethaccounts
tar -zcf ../http/gethaccounts/nodes.tar.gz nodes
