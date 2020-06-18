#!/bin/sh

# Usage:
# 
# ignition-web-server.sh.sh ignition.yml

docker run  -i --rm quay.io/coreos/fcct:release --pretty --strict < "$1" > ignition.json

docker run --name ignition-web-server -d -p 8081:80 -v `pwd`:/usr/share/nginx/html:ro nginx
