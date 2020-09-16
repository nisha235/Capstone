#!/usr/bin/env bash

# docker path
dockerpath=nisha2305/capstone_microservice

echo "Docker ID and Image: $dockerpath"

docker tag nisha2305/capstone_microservice nisha2305/capstone_microservice:v1

docker push nisha2305/capstone_microservice:v1