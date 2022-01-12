#!/bin/bash

DISPLAY=

error() {
  echo "$@" 1>&2
}


readme() {
    echo "This script will deploy an network architecture"
    echo "and configure it for operations"
}

readme

./createnetwork.sh xml/dhcpnetwork.xml

./dhcp.sh
