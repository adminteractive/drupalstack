#!/usr/bin/env bash

set -xe

# ---------------------------------------------------------------------------- #
#                                                                              #
# Readme: https://github.com/portainer/portainer                               #
#                                                                              #
# ---------------------------------------------------------------------------- #

hash docker 2> /dev/null

if [ "${?}" -ne 0 ]; then
  echo "docker command not found."

  exit 1
fi

endpoints() {
  cat <<"EOF"
[
  {
    "Name": "local",
    "URL": "unix:///var/run/docker.sock"
  }
]
EOF
}

mkdir -p /tmp/endpoints
echo -n "$(endpoints)" > /tmp/endpoints/endpoints.json
docker rm -fv portainer
docker run -d -p 80:9000 --restart="always" --name portainer -v /var/run/docker.sock:/var/run/docker.sock -v /tmp/endpoints:/endpoints portainer/portainer:latest --no-auth --external-endpoints /endpoints/endpoints.json
