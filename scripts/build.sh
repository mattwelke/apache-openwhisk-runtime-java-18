#!/bin/env bash

SECONDS_SINCE_EPOCH=$(printf '%(%s)T\n' -1)

TAG=$SECONDS_SINCE_EPOCH

# Use Docker build args to pass GitHub Packages credentials to Gradle for build.
docker build --build-arg gpr_user=$1 --build-arg gpr_key=$2 -t mwelke/openwhisk-runtime-java-18:1.0.0 .
