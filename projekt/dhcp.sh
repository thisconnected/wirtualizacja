#!/bin/bash

DISPLAY=

NAME=dhcp

../machine/./linkedclone.sh debian1 $NAME

./virscp.sh dhcp dhcp-local.sh
