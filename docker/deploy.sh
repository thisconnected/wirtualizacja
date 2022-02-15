#!/bin/bash

NAME=docker

# prepare machine
../machine/linkedclone.sh debian1 $NAME
../machine/adddrive.sh $NAME 5G
.././virscp $NAME scripts/docker-local.sh
.././virscp $NAME Dockerfile

# run local script
.././virssh $NAME '/bin/bash docker-local.sh'

