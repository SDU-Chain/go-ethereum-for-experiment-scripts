#!/usr/bin/env bash
set -e
find ./gethaccounts | grep UTC | awk -F '--' '{print $3}'
