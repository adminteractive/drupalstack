#!/usr/bin/env bash

set -e

# ---------------------------------------------------------------------------- #
#                                                                              #
# Remove project services and data.                            #
#                                                                              #
# ---------------------------------------------------------------------------- #

WORKING_DIR="$(pwd)"

SCRIPT_PATH="$(dirname ${0})"
SCRIPT_PATH="$(cd ${SCRIPT_PATH} && pwd)"

PROJECT_ROOT="$(cd ${SCRIPT_PATH}/.. && pwd)"

hash docker-compose 2> /dev/null

if [ "${?}" -ne 0 ]; then
  echo "docker-compose command not found."

  exit 1
fi

cd "${PROJECT_ROOT}"

docker-compose -f docker-compose.yml kill && docker-compose -f docker-compose.yml rm -fv

cd "${WORKING_DIR}"
