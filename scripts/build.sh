#!/bin/env bash

SECONDS_SINCE_EPOCH=$(printf '%(%s)T\n' -1)

TAG=$SECONDS_SINCE_EPOCH

docker build -t mwelke/openwhisk-runtime-java-18:$TAG .
