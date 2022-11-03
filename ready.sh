#!/bin/bash

cd /root || exit

if [ "x${MC_VERSION}" == "x" ]; then
    echo "MC_VERSION is not set"
elif [[ -z "$MC_VERSION" ]]; then
    echo "MC_VERSION is set to the empty string"
else
    if [ ! -d "./server" ]; then
      mkdir ./server
    fi
    if [ ! -f "./server/paper.jar" ]; then
        DOWNLOAD_LINK=$(java -jar paper-api.jar -r download -v "$MC_VERSION" -b latest)
        wget "$DOWNLOAD_LINK" -O ./server/paper.jar
    fi
    echo eula=true > ./server/eula.txt
    cd ./server || exit
    java -jar paper.jar nogui
fi