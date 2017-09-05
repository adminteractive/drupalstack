#!/usr/bin/env bash

set -e

# ---------------------------------------------------------------------------- #
#                                                                              #
# Enter httpd service.                                                         #
#                                                                              #
# ---------------------------------------------------------------------------- #

SCRIPT_PATH="$(dirname ${0})"
SCRIPT_PATH="$(cd ${SCRIPT_PATH} && pwd)"

PROJECT_ROOT="$(cd ${SCRIPT_PATH}/.. && pwd)"

hash docker 2> /dev/null

if [ "${?}" -ne 0 ]; then
  echo "docker command not found."

  exit 1
fi

if [ ! -f "${PROJECT_ROOT}/.env" ]; then
  cp "${PROJECT_ROOT}/.env.sample" "${PROJECT_ROOT}/.env"
fi

httpd_container_exists() {
  local PROJECT_ROOT="${1}"

  echo "$(cd ${PROJECT_ROOT} && docker-compose -f docker-compose.yml ps httpd 2> /dev/null | grep _httpd_ | awk '{ print $1 }')"
}

httpd_container_running() {
  local CONTAINER="${1}"

  echo "$(docker exec ${CONTAINER} date 2> /dev/null)"
}

HTTPD_CONTAINER="$(httpd_container_exists ${PROJECT_ROOT})"

if [ -z "${HTTPD_CONTAINER}" ]; then
  read -p "httpd service could not be found. Would you like to start the containers? [Y/n]: " ANSWER

  if [ "${ANSWER}" == "n" ]; then
    exit
  fi

  cd "${PROJECT_ROOT}"

  docker-compose -f docker-compose.yml up -d

  HTTPD_CONTAINER="$(httpd_container_exists ${PROJECT_ROOT})"

  echo "Waiting for httpd service to come up..."

  sleep 30
elif [ -z "$(httpd_container_running ${HTTPD_CONTAINER})" ]; then
  read -p "httpd service is not running. Would you like to start the containers? [Y/n]: " ANSWER

  if [ "${ANSWER}" == "n" ]; then
    exit
  fi

  cd "${PROJECT_ROOT}"

  docker-compose -f docker-compose.yml up -d

  echo "Waiting for httpd service to come up..."

  sleep 30
fi

docker exec -it "${HTTPD_CONTAINER}" bash
