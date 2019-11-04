#!/usr/bin/env bash
LISTEN_PORT=$1

echo "Installing docker..."
echo 'y\n' | apt install docker.io
echo "Docker is installed."
echo ""

echo "Downloading Wordpress Docker image..."
docker pull wordpress
echo "Wordpress Docker image is ready."
echo ""

echo "Trying to run docker on port 80..."
docker run --name wp0 -p ${LISTEN_PORT}:80 -d wordpress || { echo "Unable to deploy at port "${LISTEN_PORT}; exit 1; }
echo "Woredpress container listening on port "${LISTEN_PORT}"."

echo "Setup success!!!"