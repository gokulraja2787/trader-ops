#!/bin/sh
./create-volume.sh
./create-network.sh
echo "Running redis"
docker rm traderdb
docker run --name traderdb --network trader-network -h traderdb -p 9000:6379 -v trader-db-data:/data -d redis redis-server --appendonly yes