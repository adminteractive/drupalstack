#!/usr/bin/env bash

set -e

# ---------------------------------------------------------------------------- #
#                                                                              #
# Remove system-wide Portainer service.                                        #
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
docker rmi portainer/portainer:latest
