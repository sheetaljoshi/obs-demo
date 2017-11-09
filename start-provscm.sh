#!/bin/bash
cd "$(dirname "$0")"
virsh create ./provider-scm.xml
