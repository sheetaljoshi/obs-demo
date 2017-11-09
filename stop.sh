#!/bin/bash

cd "$(dirname "$0")"

./stop-transmitter.sh
./stop-reciever-bos.sh
./stop-reciever-sfo.sh
