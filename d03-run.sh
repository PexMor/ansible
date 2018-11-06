#!/bin/bash

source cfg

docker run -it --rm \
    --name=$DNAME \
    --hostname=$DNAME \
    $INAME \
    /bin/bash


