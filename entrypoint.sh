#!/usr/bin/env bash

if [[ -z "${UID}" ]]; then
  sudo usermod -u ${UID} neodev
fi

if [[ -z "${GID}" ]]; then
  sudo groupmod -g ${GID} neodev
fi

exec "$@"
