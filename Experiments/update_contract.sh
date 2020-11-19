#!/usr/bin/env bash
set -e
TMPFILE="$(mktemp)"
trap '[ -f "$TMPFILE" ] && rm -f "$TMPFILE"' EXIT
nano "$TMPFILE"
[[ -s "$TMPFILE" ]] && mv "$TMPFILE" ../SmartContract/truffle/contracts/MainContract.sol
