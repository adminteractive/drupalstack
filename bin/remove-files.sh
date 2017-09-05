#!/usr/bin/env bash

set -e

# ---------------------------------------------------------------------------- #
#                                                                              #
# Remove project files.                                                        #
#                                                                              #
# ---------------------------------------------------------------------------- #

SCRIPT_PATH="$(dirname ${0})"
SCRIPT_PATH="$(cd ${SCRIPT_PATH} && pwd)"

PROJECT_ROOT="$(cd ${SCRIPT_PATH}/.. && pwd)"

sudo chmod 777 -R "${PROJECT_ROOT}/www"
sudo rm -rf "${PROJECT_ROOT}/www"
mkdir -p "${PROJECT_ROOT}/www/web"
touch "${PROJECT_ROOT}/www/web/.gitkeep"
