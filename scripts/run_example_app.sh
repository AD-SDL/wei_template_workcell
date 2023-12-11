#!/bin/bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

cd $SCRIPTPATH/..

# This script is used to run the example app in the docker container.
docker compose run example_app python /example_app/example_app.py "$@"
