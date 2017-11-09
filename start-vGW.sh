#!/bin/bash

cd "$(dirname "$0")"
virsh create ./vGW.xml
