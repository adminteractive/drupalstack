#!/usr/bin/env bash

set -e

# ---------------------------------------------------------------------------- #
#                                                                              #
# Install system-wide Portainer service.                                       #
#                                                                              #
# Readme more: https://github.com/portainer/portainer                          #
#                                                                              #
# ---------------------------------------------------------------------------- #

hash docker 2> /dev/null

if [ "${?}" -ne 0 ]; then
  echo "docker command not found."

  exit 1
fi

docker rm -fv portainer || true
docker pull portainer/portainer:latest
docker run -d -p 80:9000 --restart="always" --name portainer -v /var/run/docker.sock:/var/run/docker.sock -v /tmp/endpoints:/endpoints portainer/portainer:latest --no-auth -H unix:///var/run/docker.sock
