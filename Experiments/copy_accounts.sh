#!/usr/bin/env bash
set -e

arr=($(find ./gethaccounts -name 'UTC*'))
for f in "${arr[@]}"; do
  cp "$f" "./gethdata/keystore/" || true
done

