#!/bin/bash

source cfg

docker build -t $INAME . | ts | tee tmp-build.log

