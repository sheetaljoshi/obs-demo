#!/bin/bash
cd "$(dirname "$0")"
virsh create ./gateway.xml
