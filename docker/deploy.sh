#!/bin/bash

NAME=docker

# prepare machine
../machine/linkedclone.sh debian1 $NAME
.././virscp $NAME scripts/docker-local.sh
.././virscp $NAME Dockerfile

# run local script
.././virssh $NAME '/bin/bash docker-local.sh'

