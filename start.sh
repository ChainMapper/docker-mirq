#!/bin/bash
echo "Docker MRQ wallet

By: Jos Hendriks
GitHub: https://github.com/joshendriks/
Docker: https://hub.docker.com/r/joshendriks/ 

BTC: 1NCZgpMMoNwL6ZeFsEQ2kRZEzzzTd5TuGk"

config="/config/mrq.conf"
if [ -f "$config" ]
then
    echo "Using $config"
    cp $config /data/.mrq/mrq.conf
fi

wallet="/config/wallet.dat"
if [ -f "$wallet" ]
then
    echo "Using $wallet"
    cp $wallet /data/.mrq/wallet.dat
fi

echo "Starting MRQ daemon..."
mrqd
