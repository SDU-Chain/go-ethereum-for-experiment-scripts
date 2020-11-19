#!/usr/bin/env bash
set -e

# kill server process gently
screen -S pride_exp_geth -X stuff $'\003' >/dev/null 2>&1 || true
echo "Killing geth, sleep 5s..."
sleep 5
