#!/bin/bash

echo "Welcome to media services auto deploy by vNerd"
echo ""

echo "this will install all the pre-requirments"

echo "install docker first!!"

echo "initiate docker swarm"
docker swarm init

echo "creating traefik overlay network"
docker network create -d external --attachable traefik-public

echo "DONE!!"
