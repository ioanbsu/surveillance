#!/usr/bin/env bash
#installing docker
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
#buliding smartthings mqtt bridge
sudo docker build -t smartthings-mqtt-bridge -f Dockerfile-rpi https://github.com/stjohnjohnson/smartthings-mqtt-bridge.git
# starting smartthings mqtt bridge
sudo docker run -d --name="mqtt-bridge" -v /opt/mqtt-bridge:/config -p 8080:8080 smartthings-mqtt-bridge