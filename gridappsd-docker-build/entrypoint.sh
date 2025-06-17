#!/bin/bash

if [ "$1" = "gridappsd" ]; then
  # Install application python requirements
  for reqfile in `ls /gridappsd/services/*/requirements.txt 2>/dev/null`; do
    echo "[Entrypoint] Installing requirements $reqfile"
    pip install -q --disable-pip-version-check -r $reqfile
  done
  for reqfile in `ls /gridappsd/applications/*/requirements.txt 2>/dev/null`; do
    echo "[Entrypoint] Installing requirements $reqfile"
    pip install -q --disable-pip-version-check -r $reqfile
  done

  echo "[Entrypoint] Waiting for connection"
  tail -f /dev/null
  # echo "[Entrypoint] Starting GridAPPS-D runtime"
  # exec /gridappsd/run-gridappsd.sh


elif [[ "$1" == "version" || "$1" == "-v" || "$1" == "--version" ]]; then
  echo -n "version: "
  cat /gridappsd/dockerbuildversion.txt
else
  exec "$@"
fi

