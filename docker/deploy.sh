#!/bin/bash

NAME=docker

# prepare machine
.././linkedclone.sh debian1 $NAME
./virscp.sh $NAME /scripts/docker-local.sh
./virscp.sh $NAME /scripts/Dockerfile

# run local script
./virssh.sh $NAME -c ./docker-local.sh

