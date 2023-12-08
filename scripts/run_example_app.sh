#!/bin/bash

# This script is used to run the example app in the docker container.
docker run -it --net example_workcell_default --rm example_app "$@"
