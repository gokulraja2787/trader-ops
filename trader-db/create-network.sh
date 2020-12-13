#!/bin/sh
echo "Starting trader-network"
docker network rm trader-network
docker network create --driver bridge trader-network
