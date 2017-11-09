#!/bin/bash

cd "$(dirname "$0")"

./start-transmitter.sh
./start-reciever-bos.sh
./start-reciever-sfo.sh
