#!/bin/bash

kill -9 "$(cat /var/run/consul.pid)"
rm -rf /var/data/consul
