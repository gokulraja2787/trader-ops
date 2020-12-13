#!/bin/sh
echo "Running redis with cli"
./run-redis.sh
docker rm trader-db-cli
docker run --name trader-db-cli --network trader-network -it redis redis-cli -h trader-db
